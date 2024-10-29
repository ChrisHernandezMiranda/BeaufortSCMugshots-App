import db from '../models/db.mjs';

// Controller function to get inmate data (including arrest/offense) for the last 24 hours
export const getLast24HoursWithDetails = async (req, res) => {
    try {
        const result = await db.query(`
            SELECT 
                inmate.*, 
                arrest.agency AS arrest_agency, 
                arrest.officer AS arrest_officer, 
                offense.offense_code, 
                offense.offense_description, 
                offense.bond_amount 
            FROM inmate
            LEFT JOIN arrest ON inmate.id = arrest.inmate_id
            LEFT JOIN offense ON arrest.id = offense.arrest_id
            WHERE inmate.booked_date >= NOW() - INTERVAL '24 hours';
        `);

        res.status(200).json(result.rows); // Return data with inmate, arrest, and offense details
    } catch (error) {
        console.error('Error fetching last 24 hours data:', error);
        res.status(500).json({ error: 'Failed to fetch last 24 hours data.' });
    }
};

// Controller function to get inmate data (including arrest/offense) for the last 15 days
export const getLast15DaysWithDetails = async (req, res) => {
    try {
        const result = await db.query(`
            SELECT 
                inmate.*, 
                arrest.agency AS arrest_agency, 
                arrest.officer AS arrest_officer, 
                offense.offense_code, 
                offense.offense_description, 
                offense.bond_amount 
            FROM inmate
            LEFT JOIN arrest ON inmate.id = arrest.inmate_id
            LEFT JOIN offense ON arrest.id = offense.arrest_id
            WHERE inmate.booked_date >= NOW() - INTERVAL '15 days';
        `);

        res.status(200).json(result.rows); // Return data with inmate, arrest, and offense details
    } catch (error) {
        console.error('Error fetching last 15 days data:', error);
        res.status(500).json({ error: 'Failed to fetch last 15 days data.' });
    }
};

// Controller function to get inmate data (including arrest/offense) for the last 72 hours
export const getLast72HoursWithDetails = async (req, res) => {
    try {
        const result = await db.query(`
            SELECT 
                inmate.*, 
                arrest.agency AS arrest_agency, 
                arrest.officer AS arrest_officer, 
                offense.offense_code, 
                offense.offense_description, 
                offense.bond_amount 
            FROM inmate
            LEFT JOIN arrest ON inmate.id = arrest.inmate_id
            LEFT JOIN offense ON arrest.id = offense.arrest_id
            WHERE inmate.booked_date >= NOW() - INTERVAL '72 hours';
        `);

        res.status(200).json(result.rows); // Return data with inmate, arrest, and offense details
    } catch (error) {
        console.error('Error fetching last 72 hours data:', error);
        res.status(500).json({ error: 'Failed to fetch last 72 hours data.' });
    }
};

// Controller function to get inmate data (including arrest/offense) for the last 90 days
export const getLast90DaysWithDetails = async (req, res) => {
    try {
        const result = await db.query(`
            SELECT 
                inmate.*, 
                arrest.agency AS arrest_agency, 
                arrest.officer AS arrest_officer, 
                offense.offense_code, 
                offense.offense_description, 
                offense.bond_amount 
            FROM inmate
            LEFT JOIN arrest ON inmate.id = arrest.inmate_id
            LEFT JOIN offense ON arrest.id = offense.arrest_id
            WHERE inmate.booked_date >= NOW() - INTERVAL '90 days';
        `);

        res.status(200).json(result.rows); // Return data with inmate, arrest, and offense details
    } catch (error) {
        console.error('Error fetching last 90 days data:', error);
        res.status(500).json({ error: 'Failed to fetch last 90 days data.' });
    }
};
