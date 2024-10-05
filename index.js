const express = require('express');
const { Pool } = require('pg');

const app = express();
app.use(express.json());

const pool = new Pool({
  user: 'postgres', // PostgreSQL kullanıcı adını yaz
  host: 'localhost',
  database: 'SwiftLoginBase', // Database adı
  password: 'password', // PostgreSQL şifren
  port: 5432,
});


app.post('/add-user', async (req, res) => {
  const { kname, email, password } = req.body;

  try {
    const result = await pool.query(
      `INSERT INTO users (kname, email, password) VALUES ($1, $2, crypt($3, gen_salt('bf'))) RETURNING *`,
      [kname, email, password]
    );
    res.json(result.rows[0]);
  } catch (error) {
    console.error(error);
    res.status(500).send('Veritabanına ekleme hatası');
  }
});

app.post('/login', async (req, res) => {
  const { email, password } = req.body;

  try {
    const result = await pool.query(
      `SELECT * FROM users WHERE email = $1 AND password = crypt($2, password)`,
      [email, password]
    );

    if (result.rows.length > 0) {
      res.json(result.rows[0]); 
    } else {
      res.status(401).send('Geçersiz e-posta veya şifre');
    }
  } catch (error) {
    console.error(error);
    res.status(500).send('Giriş hatası');
  }
});

const port = 3000;
app.listen(port, () => {
  console.log(`Server ${port} portunda çalışıyor.`);
});
