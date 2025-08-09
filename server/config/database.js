const DatabaseConnection = require('./DatabaseConnection');

const db = new DatabaseConnection();

(async () => {
  try {
    await db.connect();
    const conn = db.getConnection();
    const [rows] = await conn.query('SELECT * FROM DimCard');
    console.log(rows);
  } catch (err) {
    console.error('🚨 DB Error:', err.message);
  }
})();
