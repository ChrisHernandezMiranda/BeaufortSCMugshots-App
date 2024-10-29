// server/server.mjs
import dotenv from 'dotenv';
dotenv.config(); // Load environment variables from .env file

import express from 'express';
import xmlRoutes from './routes/xmlRoutes.mjs'; // Ensure xmlRoutes is imported
import { fetchAndStoreXML } from './controllers/xmlController.mjs'; // Import the function
import cron from 'node-cron';
import arrestRecordsRoutes from './routes/arrestRecordsRoutes.mjs';

const app = express();
const PORT = process.env.PORT || 5000;

// Middleware to parse JSON requests
app.use(express.json());

// Cron job to fetch XML data every 8 hours
cron.schedule('43 23 * * *', () => {
  console.log('Fetching and storing XML data...');
  fetchAndStoreXML()
      .catch((error) => {
          console.error('Failed to fetch and store XML data:', error);
      });
});
// Use the xmlRoutes
app.use('/xml', xmlRoutes);
app.use('/inmates', arrestRecordsRoutes);


// Start the server
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
