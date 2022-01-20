//inporting the mysql2 package
const mysql = require('mysql2');

const db = mysql.createConnection(
    {
        host: 'localhost',
        // your sql username,
        user: 'root',
        password:'',
        database: 'election'
    },
    console.log('Connected to the election database.')
);

module.exports = db;
