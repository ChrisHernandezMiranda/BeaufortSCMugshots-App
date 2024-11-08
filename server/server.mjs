import dotenv from 'dotenv';
dotenv.config();

import express from 'express';
import cors from 'cors';
import path from 'path';
import cron from 'node-cron';
import { fileURLToPath } from 'url';
import axios from 'axios';

import xmlRoutes from './routes/xmlRoutes.mjs';
import arrestRecordsRoutes from './routes/arrestRecordsRoutes.mjs';
import { fetchAndStoreXML } from './controllers/xmlController.mjs';

const app = express();
const PORT = process.env.PORT || 5000;

app.use(express.json());
app.use(cors());

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const clientDistPath = path.join(__dirname, '../mugshots-app-client/dist');

app.use(express.static(clientDistPath));

cron.schedule('0 */2 * * *', () => {
  fetchAndStoreXML().catch((error) => {
    console.error('Failed to fetch and store XML data:', error);
  });
});

app.use('/xml', xmlRoutes);
app.use('/inmates', arrestRecordsRoutes);

app.get('/proxy-image', async (req, res) => {
  const imageUrl = req.query.url;

  if (!imageUrl) {
    return res.status(400).send('Image URL is required');
  }
  if (!imageUrl.startsWith('http://')) {
    return res.status(400).send('Invalid image URL');
  }

  try {
    const response = await axios.get(imageUrl, { responseType: 'arraybuffer' });
    res.set('Content-Type', 'image/jpeg');
    res.send(response.data);
  } catch (error) {
    console.error('Error fetching image:', error);
    res.status(500).send('Error fetching image. Please check the URL and try again.');
  }
});

app.get('*', (req, res) => {
  res.sendFile(path.join(clientDistPath, 'index.html'));
});

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});

console.log("Database URL:", process.env.DATABASE_URL);
