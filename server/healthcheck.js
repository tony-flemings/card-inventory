// healthcheck.js
const mysql = require('mysql2');

const connection = mysql.createConnection({
  host: getEnvVar(MYSQL_DATABASE),
  user: getEnvVar(DOCKER_USER),
  password: getEnvVar(DOCKER_PASS),
  database: getEnvVar(MYSQL_DATABASE),
});

connection.connect(err => {
  if (err) {
    console.error('DB connection failed:', err.message);
    process.exit(1);
  } else {
    console.log('DB connection successful');
    connection.end();
    process.exit(0);
  }
});

function getEnvVar(name) {
  const value = process.env[name];
  if (!value) {
    console.error(`Missing required environment variable: ${name}`);
    process.exit(1);
  }
  return value;
}
