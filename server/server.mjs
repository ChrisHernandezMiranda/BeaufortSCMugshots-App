import dotenv from 'dotenv';
dotenv.config();

import express from 'express';
import cors from 'cors';
import path from 'path';
import cron from 'node-cron';
import { fileURLToPath } from 'url';

import xmlRoutes from './routes/xmlRoutes.mjs';
import arrestRecordsRoutes from './routes/arrestRecordsRoutes.mjs';
import { fetchAndStoreXML } from './controllers/xmlController.mjs';

const app = express();
const PORT = process.env.PORT || 5000;

app.use(express.json());
app.use(cors());

// Derive the absolute path for the `dist` folder
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const clientDistPath = path.join(__dirname, '../mugshots-app-client/dist');

// Serve static files from the frontend's `dist` folder
app.use(express.static(clientDistPath));

cron.schedule('0 */2 * * *', () => {
  console.log('Fetching and storing XML data...');
  fetchAndStoreXML()
    .catch((error) => {
      console.error('Failed to fetch and store XML data:', error);
    });
});

app.use('/xml', xmlRoutes);
app.use('/inmates', arrestRecordsRoutes);

// Catch-all route to serve the frontend app
app.get('*', (req, res) => {
  res.sendFile(path.join(clientDistPath, 'index.html'));
});

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
