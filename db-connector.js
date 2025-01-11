const mysql = require('mysql');
require('dotenv').config(); // Ensure you have 'dotenv' installed

// Using environment variables for credentials
const db = mysql.createConnection({
    host            : process.env.DB_HOST || 'classmysql.engr.oregonstate.edu',
    user            : process.env.DB_USER || 'cs340_bakerset',
    password        : process.env.DB_PASSWORD || '9240',
    database        : process.env.DB_NAME || 'cs340_bakerset'
});

// Connect to the database
db.connect((err) => {
    if (err) {
        console.error('Database connection failed: ' + err.stack);
        return;
    }
    console.log('Connected to MySQL database.');
});

// Use a connection pool instead of a single connection for better performance in production
const pool = mysql.createPool({
    connectionLimit: 10, // Adjust based on expected load
    host            : process.env.DB_HOST || 'classmysql.engr.oregonstate.edu',
    user            : process.env.DB_USER || 'cs340_bakerset',
    password        : process.env.DB_PASSWORD || '9240',
    database        : process.env.DB_NAME || 'cs340_bakerset'
});

// Export the pool for usage in other files
module.exports = pool;