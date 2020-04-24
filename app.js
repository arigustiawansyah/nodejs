//use path module
const path = require('path');
//use express module
const express = require('express');
const session = require('express-session');
const Handlebars = require("express-handlebars");
//use hbs view engine
const hbs = require('hbs');
//use bodyParser middleware
const bodyParser = require('body-parser');
//use mysql database
const mysql = require('mysql');
const app = express();
//Create Connection
const conn = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'bendicar'
});
//connect to database
conn.connect((err) =>{
  if(err) throw err;
  console.log('berhasil...');
});

//set views file
app.set('views',path.join(__dirname,'views'));
//set view engine
app.set('view engine', 'hbs');
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
//set folder public as static folder for static file
app.use('/public',express.static(__dirname + '/public'));

app.use(session({
  secret: 'secret',
  resave: true,
  saveUninitialized: true
}));

//route 
 app.post('/auth', function(req, res) {
  var username = req.body.username;
  var password = req.body.password;
  if (username && password) {
    conn.query('SELECT * FROM login WHERE username = ? AND password = ?', [username, password], function(error, results, fields) {
      if (results.length > 0) {
        req.session.loggedin = true;
        req.session.username = username;
        res.redirect('/index');
      } else {
        res.send('Nama atau password anda salah!');
      }     
      res.end();
    });
  } else {
    res.send('Masukan Nama dan Password anda!');
    res.end();
  }
});
//login akun 
app.get('/', function(req, res) {
  res.render('login');
});
//register akun
app.get('/register', function(req, res) {
  res.render('register');
});

//logout akun
app.get('/logout', function(req, res){
  req.session.loggedin = false;
  res.redirect('/')
});

app.post('/save_register',(req, res) => {
  let data = {id: req.body.id, username: req.body.username,password: req.body.password};
  let sql = "INSERT INTO login SET ?";
  let query = conn.query(sql, data,(err, results) => {
      if(err) throw err;
        res.redirect('/');
      });
    });

app.get('/index', function(req, res){
    res.render("index");
});

<!--petugas-->
//route for homepage
app.get('/petugas',(req, res) => {
  let sql = "SELECT * FROM petugas";
  let query = conn.query(sql, (err, results) => {
    if(err) throw err;
    res.render('petugas',{
      results: results
    });
  });
});
//route for insert data
app.post('/save_petugas',(req, res) => {
  let data = {id_petugas:req.body.id_petugas, 
  nm_petugas:req.body.nm_petugas,
  jk:req.body.jk, 
  jabatan: req.body.jabatan, 
  gaji:req.body.gaji};
  let sql = "INSERT INTO petugas set ?";
  let query = conn.query(sql, data,(err, results) => {
    if(err) throw err;
    res.redirect('/petugas');
  });
});

//route for update data
app.post('/update_petugas',(req, res) => {
  let sql = "UPDATE petugas SET nm_petugas='"+req.body.nm_petugas+"', jk='"+req.body.jk+"', jabatan='"+req.body.jabatan+"', gaji='"+req.body.gaji+"' WHERE id_petugas="+req.body.id_petugas;
  let query = conn.query(sql, (err, results) => {
    if(err) throw err;
    res.redirect('/petugas');
  });
});

//route for delete data
app.post('/delete_petugas',(req, res) => {
  let sql = "DELETE FROM petugas WHERE id_petugas="+req.body.id_petugas+"";
  let query = conn.query(sql, (err, results) => {
    if(err) throw err;
      res.redirect('/petugas');
  });
});
<!--petugas-->

<!--penyewa-->
//route for homepage
app.get('/penyewa',(req, res) => {
  let sql = "SELECT * FROM penyewa";
  let query = conn.query(sql, (err, results) => {
    if(err) throw err;
    res.render('penyewa',{
      results: results
    });
  });
});

//route for insert data
app.post('/save_penyewa',(req, res) => {
  let data = {id_penyewa:req.body.id_penyewa, nm_penyewa:req.body.nm_penyewa, jk:req.body.jk, alamat_penyewa: req.body.alamat_penyewa, no_hp:req.body.no_hp};
  let sql = "INSERT INTO penyewa set ?";
  let query = conn.query(sql, data,(err, results) => {
    if(err) throw err;
    res.redirect('/penyewa');
  });
});

//route for update data
app.post('/update_penyewa',(req, res) => {
  let sql = "UPDATE penyewa SET nm_penyewa='"+req.body.nm_penyewa+"', jk='"+req.body.jk+"', alamat_penyewa'"+req.body.alamat_penyewa+"', alamat_penyewa='"+req.body.alamat_penyewa+"' WHERE id_penyewa="+req.body.id_penyewa;
  let query = conn.query(sql, (err, results) => {
    if(err) throw err;
    res.redirect('/penyewa');
  });
});

//route for delete data
app.post('/delete_penyewa',(req, res) => {
  let sql = "DELETE FROM penyewa WHERE id_penyewa="+req.body.id_penyewa+"";
  let query = conn.query(sql, (err, results) => {
    if(err) throw err;
      res.redirect('/penyewa');
  });
});
<!--penyewa-->

<!--denda-->
//route for homepage
app.get('/denda',(req, res) => {
  let sql = "SELECT * FROM denda";
  let query = conn.query(sql, (err, results) => {
    if(err) throw err;
    res.render('denda',{
      results: results
    });
  });
});

//route for insert data
app.post('/save_denda',(req, res) => {
  let data = {id_denda:req.body.id_denda, nm_denda:req.body.nm_denda, harga_denda:req.body.harga_denda, keterangan: req.body.keterangan};
  let sql = "INSERT INTO denda set ?";
  let query = conn.query(sql, data,(err, results) => {
    if(err) throw err;
    res.redirect('/denda');
  });
});

//route for update data
app.post('/update_denda',(req, res) => {
  let sql = "UPDATE denda SET nm_denda='"+req.body.nm_denda+"', harga_denda='"+req.body.harga_denda+"', keterangan='"+req.body.keterangan+"' WHERE id_denda="+conn.escape(req.body.id_denda);
  let query = conn.query(sql, (err, results) => {
    if(err) throw err;
    res.redirect('/denda');
  });
});

//route for delete data
app.post('/delete_denda',(req, res) => {
  let sql = "DELETE FROM denda WHERE id_denda="+conn.escape(req.body.id_denda);
  let query = conn.query(sql,(err, results) => {
    if(err) throw err;
      res.redirect('/denda');
  });
});
<!--denda-->

<!--kendaraan-->
//route for homepage
app.get('/kendaraan',(req, res) => {
  let sql = "SELECT * FROM kendaraan";
  let query = conn.query(sql, (err, results) => {
    if(err) throw err;
    res.render('kendaraan',{
      results: results
    });
  });
});

//route for insert data
app.post('/save_kendaraan',(req, res) => {
  let data = {no_pol:req.body.no_pol, jeniskendaraan:req.body.jeniskendaraan, merk:req.body.merk, hargasewa: req.body.hargasewa};
  let sql = "INSERT INTO kendaraan set ?";
  let query = conn.query(sql, data,(err, results) => {
    if(err) throw err;
    res.redirect('/kendaraan');
  });
});

//route for update data
app.post('/update_kendaraan',(req, res) => {
  let sql = "UPDATE kendaraan SET jeniskendaraan='"+req.body.jeniskendaraan+"', merk='"+req.body.merk+"', hargasewa='"+req.body.hargasewa+"' WHERE no_pol="+conn.escape(req.body.no_pol);
  let query = conn.query(sql, (err, results) => {
    if(err) throw err;
    res.redirect('/kendaraan');
  });
});

//route for delete data
app.post('/delete_kendaraan',(req, res) => {
  let sql = "DELETE FROM kendaraan WHERE no_pol="+conn.escape(req.body.no_pol);
  let query = conn.query(sql, (err, results) => {
    if(err) throw err;
      res.redirect('/kendaraan');
  });
});
<!--kendaraan-->

<!--peminjaman-->
//route for homepage
app.get('/peminjaman',(req, res) => {
  let sql = "SELECT * FROM peminjaman";
  let query = conn.query(sql, (err, results) => {
    if(err) throw err;
    res.render('peminjaman',{
      results: results
    });
  });
});

//route for insert data
app.post('/save_peminjaman',(req, res) => {
  let data = {no_transaksi:req.body.no_transaksi, tgl_peminjaman:req.body.tgl_peminjaman, id_petugas:req.body.id_petugas, id_penyewa: req.body.id_penyewa, no_pol:req.body.no_pol, lama_peminjaman:req.body.lama_peminjaman, harga:req.body.harga, jk:req.body.jk};
  let sql = "INSERT INTO peminjaman set ?";
  let query = conn.query(sql, data,(err, results) => {
    if(err) throw err;
    res.redirect('/peminjaman');
  });
});

//route for update data
app.post('/update_peminjaman',(req, res) => {
  let sql = "UPDATE peminjaman SET tgl_peminjaman='"+req.body.tgl_peminjaman+"', id_petugas='"+req.body.id_petugas+"', id_penyewa='"+req.body.id_penyewa+"', no_pol='"+req.body.no_pol+"', lama_peminjaman='"+req.body.lama_peminjaman+"', harga='"+req.body.harga+"', jk='"+req.body.jk+"' WHERE no_transaksi="+conn.escape(req.body.no_transaksi);
  let query = conn.query(sql, (err, results) => {
    if(err) throw err;
    res.redirect('/peminjaman');
  });
});

//route for delete data
app.post('/delete_peminjaman',(req, res) => {
  let sql = "DELETE FROM peminjaman WHERE no_transaksi="+conn.escape(req.body.no_transaksi);
  let query = conn.query(sql, (err, results) => {
    if(err) throw err;
      res.redirect('/peminjaman');
  });
});
<!--peminjaman-->

<!--pengembalian-->
//route for homepage
app.get('/pengembalian',(req, res) => {
  let sql = "SELECT * FROM pengembalian";
  let query = conn.query(sql, (err, results) => {
    if(err) throw err;
    res.render('pengembalian',{
      results: results
    });
  });
});

//route for insert data
app.post('/save_pengembalian',(req, res) => {
  let data = {no_transaksi:req.body.no_transaksi, tgl_kembali:req.body.tgl_kembali, id_petugas:req.body.id_petugas, id_penyewa: req.body.id_penyewa, no_pol:req.body.no_pol, id_denda:req.body.id_denda, harga:req.body.harga };
  let sql = "INSERT INTO pengembalian set ?";
  let query = conn.query(sql, data,(err, results) => {
    if(err) throw err;
    res.redirect('/pengembalian');
  });
});

//route for update data
app.post('/update_pengembalian',(req, res) => {
  let sql = "UPDATE pengembalian SET tgl_kembali='"+req.body.tgl_kembali+"', id_petugas='"+req.body.id_petugas+"', id_penyewa='"+req.body.id_penyewa+"', no_pol='"+req.body.no_pol+"', id_denda='"+req.body.id_denda+"', harga='"+req.body.harga+"' WHERE no_transaksi="+conn.escape(req.body.no_transaksi);
  let query = conn.query(sql, (err, results) => {
    if(err) throw err;
    res.redirect('/pengembalian');
  });
});

//route for delete data
app.post('/delete_pengembalian',(req, res) => {
  let sql = "DELETE FROM pengembalian WHERE no_transaksi="+conn.escape(req.body.no_transaksi);
  let query = conn.query(sql, (err, results) => {
    if(err) throw err;
      res.redirect('/pengembalian');
  });
});
<!--pengembalian-->


//server listening
app.listen(2000, () => {
  console.log('Server is running at port 2000');
});
