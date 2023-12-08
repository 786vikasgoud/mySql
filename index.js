const mysql = require("mysql2");
function index() {
  // create the connection to database
  const connection = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: `very_strong_password`,
    database: "IPLproject",
  });

  // simple query
  connection.query("SELECT * FROM matches", function (err, results) {
    if (err) return;
    // results contains rows returned by server
    console.log(results); // fields contains extra meta data about results, if available
  });
  connection.connect((err) => {
    if (err) {
      throw err;
    } else {
      console.log("connet");
      connection.end();
    }
  });
}
index();
module.exports = index;
