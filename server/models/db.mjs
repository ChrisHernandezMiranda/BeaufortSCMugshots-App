import pg from 'pg'; // Import pg using default import
import dotenv from 'dotenv'; // Import dotenv to load .env variables

dotenv.config(); // Load environment variables from .env file

const { Pool } = pg; // Extract Pool from the default import

// Log the connection parameters for debugging
console.log('Connecting to database with:', {
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  database: process.env.DB_NAME,
  port: process.env.DB_PORT,
});

// Initialize the Pool with your database configuration
const pool = new Pool({
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  database: process.env.DB_NAME,
  password: process.env.DB_PASSWORD,
  port: process.env.DB_PORT,
});

// Export the pool for use in other files
export default pool;
