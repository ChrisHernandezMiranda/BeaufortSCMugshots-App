import fetch from 'node-fetch'; // Ensure you have node-fetch installed
import { Parser } from 'xml2js'; // Ensure you have xml2js installed
import db from '../models/db.mjs'; // Adjust the import according to your database setup

// Helper function to format date from a string
const formatDate = (dateString) => {
    if (!dateString) return null;
    const date = new Date(dateString);
    return date.toISOString().split('T')[0]; // YYYY-MM-DD format
};

// Helper function to format time from a string
const formatTime = (timeString) => {
    if (!timeString) return null;
    const time = new Date(`1970-01-01T${timeString}`);
    return time.toTimeString().split(' ')[0]; // HH:MM:SS format
};

export const fetchAndStoreXML = async () => {
    try {
        // Clear previous entries
        await db.query('DELETE FROM offense;');
        await db.query('DELETE FROM arrest;');
        await db.query('DELETE FROM inmate;');
        console.log("Cleared previous database entries.");

        const response = await fetch('http://mugshots.bcgov.net/booked90.xml');
        if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
        }

        const xmlText = await response.text();
        console.log("Raw XML response:", xmlText);

        const parser = new Parser();
        const result = await parser.parseStringPromise(xmlText);
        console.log("Parsed XML result:", JSON.stringify(result, null, 2));

        const inmates = result.envelop.ins[0].in;

        if (!inmates || !Array.isArray(inmates)) {
            throw new Error('Inmates not found in the parsed XML');
        }

        for (const inmate of inmates) {
            const { nl, nf, nm, street, csz, racegen, sex, dob, ht, wt, bn, image1, ar, age } = inmate;

            const mugshotUrl = image1 && image1[0] && image1[0].$ && image1[0].$.src ? image1[0].$.src : null;

            // Update the booked_date and booked_time fields according to your XML structure
            const bookedDate = formatDate(inmate.dtin ? inmate.dtin[0] : null);
            const bookedTime = formatTime(inmate.tmin ? inmate.tmin[0] : null);
            const releaseDate = inmate.dtout && inmate.dtout[0] === "Confined" ? null : formatDate(inmate.dtout ? inmate.dtout[0] : null);
            const releaseTime = inmate.dtout && inmate.dtout[0] === "Confined" ? null : formatTime(inmate.tmout ? inmate.tmout[0] : null);

            const dateOfBirth = formatDate(dob ? dob[0] : null);
            
            // Correctly access age directly
            const ageValue = age && age[0] ? parseInt(age[0]) : null; // Accessing the age directly

            // Debugging logs for inmate data and age extraction
            console.log(`Inmate Data: ${JSON.stringify(inmate)}`);
            console.log(`Extracted Age: ${ageValue}, Date of Birth: ${dateOfBirth}`);

            // Log if date formatting fails
            if (!dateOfBirth || !bookedDate) {
                console.error('Invalid date format found:', { dateOfBirth, bookedDate });
                continue;
            }

            // Inserting inmate details
            const inmateQuery = `
                INSERT INTO inmate (
                    last_name, first_name, middle_name, street, 
                    city_state_zip, race_gender, sex, date_of_birth, 
                    age, height, weight, booking_number, 
                    booked_date, booked_time, release_date, 
                    release_time, mugshot_url
                )
                VALUES ($1, $2, $3, $4, $5, $6, $7, $8, 
                        $9, $10, $11, $12, $13, $14, $15, 
                        $16, $17)
                RETURNING id;
            `;

            const inmateValues = [
                nl[0], nf[0], nm[0], street[0], csz[0], 
                racegen[0], sex[0], dateOfBirth, 
                ageValue, ht[0], wt[0], bn[0], 
                bookedDate, bookedTime, releaseDate, 
                releaseTime, mugshotUrl
            ];

            // Log values before inserting into the database
            console.log(`Inmate Values: ${JSON.stringify(inmateValues)}`);

            const inmateRes = await db.query(inmateQuery, inmateValues);
            const inmateId = inmateRes.rows[0].id;
            console.log('Inserted inmate with ID:', inmateId);

            // Handle arrest details if available
            if (ar && ar[0]) {
                const { aa, ao, bn: arrestBn } = ar[0];

                const arrestQuery = `
                    INSERT INTO arrest (
                        inmate_id, agency, officer, 
                        booking_number
                    )
                    VALUES ($1, $2, $3, $4)
                    RETURNING id;
                `;
                const arrestValues = [
                    inmateId, aa[0], ao[0], arrestBn[0]
                ];

                const arrestRes = await db.query(arrestQuery, arrestValues);
                const arrestId = arrestRes.rows[0].id;
                console.log('Inserted arrest with ID:', arrestId);

                // Handle offenses related to the arrest
                if (ar[0].of && Array.isArray(ar[0].of)) {
                    for (const offense of ar[0].of) {
                        const { os, ow, ol, ob, oc } = offense; // Assuming 'ow' is offense description

                        const offenseQuery = `
                            INSERT INTO offense (
                                arrest_id, offense_code, 
                                offense_description, offense_location, 
                                bond_amount, court
                            )
                            VALUES ($1, $2, $3, $4, $5, $6);
                        `;
                        const offenseValues = [
                            arrestId, os[0], ow[0], 
                            ol[0], ob[0] ? parseFloat(ob[0]) : null, oc[0]
                        ];

                        await db.query(offenseQuery, offenseValues);
                        console.log('Inserted offense for arrest ID:', arrestId);
                    }
                }
            }
        }
    } catch (error) {
        console.error('Error fetching and storing XML data:', error);
        throw error;
    }
};
