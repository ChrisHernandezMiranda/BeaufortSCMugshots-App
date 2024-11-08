import pg from 'pg';
import dotenv from 'dotenv';

dotenv.config();

const { Pool } = pg;


const isHeroku = process.env.DATABASE_URL;


const pool = new Pool({
  connectionString: isHeroku
    ? process.env.DATABASE_URL  
    : `postgres://${process.env.DB_USER}:${process.env.DB_PASSWORD}@${process.env.DB_HOST}:${process.env.DB_PORT}/${process.env.DB_NAME}`,
  ssl: isHeroku ? { rejectUnauthorized: false } : false,  
});


console.log('Connecting to database with:', {
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  database: process.env.DB_NAME,
  port: process.env.DB_PORT,
});


export default pool;
