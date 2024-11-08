import pkg from 'pg';
const { Pool } = pkg;

// Set up the pool using the DATABASE_URL environment variable for Heroku
const pool = new Pool({
  connectionString: process.env.DATABASE_URL, // Use DATABASE_URL set by Heroku
  ssl: {
    rejectUnauthorized: false, // Disable SSL verification for production
  },
});

export default pool;
