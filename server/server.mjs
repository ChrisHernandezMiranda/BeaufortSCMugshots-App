import dotenv from 'dotenv';
dotenv.config(); // Load environment variables from .env file

import express from 'express';
import cors from 'cors';
import path from 'path';
import cron from 'node-cron';

// Import Routes
import xmlRoutes from './routes/xmlRoutes.mjs';
import arrestRecordsRoutes from './routes/arrestRecordsRoutes.mjs';

// Import the function to fetch and store XML data
import { fetchAndStoreXML } from './controllers/xmlController.mjs';

// Initialize Express app
const app = express();
const PORT = process.env.PORT || 5000;

// Middleware to parse JSON requests
app.use(express.json());

// Enable CORS to allow cross-origin requests from the frontend
app.use(cors());

// Serve static files from the React app in production
// Use import.meta.url to get the current directory in ES modules
app.use(express.static(path.join(path.dirname(import.meta.url), '../mugshots-app-client/build')));

// Cron job to fetch XML data every 8 hours (adjust the schedule as necessary)
cron.schedule('0 */2 * * *', () => {
  console.log('Fetching and storing XML data...');
  fetchAndStoreXML()
    .catch((error) => {
      console.error('Failed to fetch and store XML data:', error);
    });
});


app.use('/xml', xmlRoutes);
app.use('/inmates', arrestRecordsRoutes);


app.get('*', (req, res) => {
  res.sendFile(path.join(path.dirname(import.meta.url), '../mugshots-app-client/build', 'index.html'));
});

// Start the server
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
