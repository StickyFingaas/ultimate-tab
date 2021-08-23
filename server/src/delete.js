import { createRequire } from 'module';
const require = createRequire(import.meta.url);

var postgres = require('postgres');

var con = postgres.createConnection({
  host: "localhost",
  user: "yourusername",
  password: "yourpassword",
  database: "mydb"
});

con.connect(function(err) {
  if (err) throw err;
  var postgres = "DROP TABLE User";
  con.query(sql, function (err, result) {
    if (err) throw err;
    console.log("Table deleted");
  });
});