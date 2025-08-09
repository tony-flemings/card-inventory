require('dotenv').config();
const mysql = require('mysql2/promise');

class DatabaseConnection {
  constructor() {
    this.host = process.env.DB_HOST;
    this.username = process.env.DB_USER;
    this.password = process.env.DB_PASSWORD;
    this.database = process.env.DB_NAME;
    this.tries = 5;
    this.delay = 2000;
    this.port = 3306;
    this.connection = null;
  }

  async connect() {
    while (this.tries > 0) {
      try {
        this.connection = await mysql.createConnection({
          host: this.host,
          user: this.username,
          password: this.password,
          database: this.database,
          port: this.port
        });
        console.log('✅ Connected to MySQL');
        return this.connection;
      } catch (error) {
        this.tries--;
        console.warn(`❌ Connection failed. Retries left: ${this.tries}`);
        console.log(error.prototype.name);
        console.log(this);
        if (this.tries === 0) throw error;
        await new Promise(res => setTimeout(res, this.delay));
      }
    }
  }

  getConnection() {
    if (!this.connection) {
      throw new Error('Connection not established. Call connect() first.');
    }
    return this.connection;
  }
}

module.exports = DatabaseConnection;
