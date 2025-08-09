const requiredVars = ['DB_HOST', 'DB_USER', 'DB_PASSWORD', 'MYSQL_DATABASE'];

requiredVars.forEach((key) => {
  if (!process.env[key]) {
    console.error(`Missing required env var: ${key}`);
    process.exit(1);
  }
});
