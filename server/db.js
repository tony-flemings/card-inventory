const mysql = require('mysql2');

class DatabaseConnection {
    constructor (host, username, password, database){
        this.host = host,
        this.username = username,
        this.password = password,
        this.database = database,
        this.tries = 5}
     

    connect() {
        while (this.tries > 0) {
            try {
                mysql.createConnection({
                    host: this.host,
                    user: this.username,
                    password: this.password,
                    database: this.database,
                 });} catch (error) {
                tries--;
                continue;}
            tries = 0;}}}
module.exports = DatabaseConnection;
