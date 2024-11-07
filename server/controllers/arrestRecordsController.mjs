import db from '../models/db.mjs'; 
export const getAllInmatesWithDetails = async (req, res) => {
    try {
        const result = await db.query(`
            SELECT 
                inmate.*, 
                inmate.last_updated AS inmate_last_updated,  -- Include last_updated from inmate
                arrest.id AS arrest_id,
                arrest.agency AS arrest_agency, 
                arrest.officer AS arrest_officer, 
                arrest.last_updated AS arrest_last_updated,  -- Include last_updated from arrest
                offense.offense_code, 
                offense.offense_description, 
                offense.bond_amount,
                offense.offense_location, 
                offense.last_updated AS offense_last_updated  -- Include last_updated from offense
            FROM inmate
            LEFT JOIN arrest ON inmate.id = arrest.inmate_id
            LEFT JOIN offense ON arrest.id = offense.arrest_id
            ORDER BY inmate.id;  -- Optional: Order by inmate ID
        `);

       
        const inmatesMap = {};

        result.rows.forEach(row => {
            const inmateId = row.id;

            // Check if the inmate already exists in the map
            if (!inmatesMap[inmateId]) {
                inmatesMap[inmateId] = {
                    inmate_id: inmateId,
                    last_name: row.last_name,
                    first_name: row.first_name,
                    middle_name: row.middle_name,
                    street: row.street,
                    city_state_zip: row.city_state_zip,
                    race_gender: row.race_gender,
                    sex: row.sex,
                    date_of_birth: row.date_of_birth,
                    age: row.age,
                    height: row.height,
                    weight: row.weight,
                    booking_number: row.booking_number,
                    booked_date: row.booked_date,
                    booked_time: row.booked_time,
                    release_date: row.release_date,
                    release_time: row.release_time,
                    mugshot_url: row.mugshot_url,
                    last_updated: row.inmate_last_updated,  // Add last_updated for inmate
                    arrests: [] // Initialize an empty array for arrests
                };
            }

            // If there is an arrest, add it to the inmate's arrests array
            if (row.arrest_id) {
                const arrest = {
                    arrest_id: row.arrest_id,
                    arrest_agency: row.arrest_agency,
                    arrest_officer: row.arrest_officer,
                    last_updated: row.arrest_last_updated,  // Add last_updated for arrest
                    offenses: [] // Initialize an empty array for offenses
                };

                // Add offenses related to the arrest if they exist
                if (row.offense_code) {
                    arrest.offenses.push({
                        offense_code: row.offense_code,
                        offense_description: row.offense_description || "", // Default to empty if missing
                        bond_amount: row.bond_amount,
                        offense_location: row.offense_location || "", // Include offense location
                        last_updated: row.offense_last_updated  // Add last_updated for offense
                    });
                }

                // Push the arrest to the inmate's arrests array
                inmatesMap[inmateId].arrests.push(arrest);
            }
        });

        // Convert map to array for response
        const inmatesArray = Object.values(inmatesMap);

        res.status(200).json(inmatesArray); // Return the structured data
    } catch (error) {
        console.error('Error fetching all inmate data:', error);
        res.status(500).json({ error: 'Failed to fetch all inmate data.' });
    }
};
