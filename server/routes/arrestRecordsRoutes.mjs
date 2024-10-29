
import express from 'express';
import { 
    getLast90DaysWithDetails, 
    getLast72HoursWithDetails, 
    getLast15DaysWithDetails, 
    getLast24HoursWithDetails 
} from '../controllers/arrestRecordsController.mjs';

const router = express.Router();

// Define the routes
router.get('/last90days', getLast90DaysWithDetails);
router.get('/last72hours', getLast72HoursWithDetails);
router.get('/last15days', getLast15DaysWithDetails);
router.get('/last24hours', getLast24HoursWithDetails);

export default router;