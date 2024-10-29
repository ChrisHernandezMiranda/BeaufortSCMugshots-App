// server/routes/xmlRoutes.js

import express from 'express';
import { fetchAndStoreXML } from '../controllers/xmlController.mjs';

const router = express.Router();

// Define the GET route for fetching XML
router.get('/fetch', async (req, res) => {
    try {
        await fetchAndStoreXML();
        res.status(200).json({ message: 'XML data fetched and stored successfully.' });
    } catch (error) {
        console.error('Error fetching XML data:', error);
        res.status(500).json({ error: 'Failed to fetch XML data.' });
    }
});

export default router;
