import express from 'express';
import { getAllInmatesWithDetails } from '../controllers/arrestRecordsController.mjs'; // Adjust the path as needed

const router = express.Router();

// Route to get all inmates with details
router.get('/', getAllInmatesWithDetails);

export default router;
