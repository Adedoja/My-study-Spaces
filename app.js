
const express = require('express');
const mysql = require('mysql2/promise');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(express.json());

const pool = mysql.createPool({
  host: 'localhost',
  user: '',
  password: '',
  database: 'personalproject'
});

app.post('/available-rooms', async (req, res) => {
  const { begin, end, day } = req.body;

  try {
    const [result] = await pool.query(
      `CALL Find_Available_Rooms(?, ?, ?)`,
      [begin, end, day]
    );
    res.json(result[0]);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'An error occurred fetching the rooms.' });
  }
});

app.listen(3000, () => {
  console.log('server running on http://localhost:3000');

});
