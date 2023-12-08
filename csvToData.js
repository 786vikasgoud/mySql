//csv to db
const fs = require("fs");
const mysql = require("mysql2");
const csvParser = require("csv-parser");

// MySQL database connection configuration
const connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "very_strong_password",
  database: "IPLproject",
});

// Replace 'your_csv_file.csv' with the actual CSV file name
const csvFilePath = "/home/vikas/Desktop/mysql/src/data/matches.csv";

// Replace 'your_table_name' with the desired table name
const tableName = "matches";

//Read the CSV file and process its contents
const rows = [];

fs.createReadStream(csvFilePath)
  .pipe(csvParser())
  .on("data", (row) => {
    rows.push(row);
  })
  .on("end", () => {
    // Construct the INSERT statement
    const columns = Object.keys(rows[0]).join(", ");
    const values = rows.map(
      (row) =>
        "(" +
        Object.values(row)
          .map((value) => connection.escape(value))
          .join(", ") +
        ")"
    );
    const insertSQL = `INSERT INTO ${tableName} (${columns}) VALUES ${values.join(
      ", "
    )}`;

    // Execute the INSERT statement
    connection.query(insertSQL, (err, results) => {
      if (err) {
        console.error("Error inserting data:", err);
      } else {
        console.log("Data inserted successfully:", results);
      }

      // Close the database connection
      connection.end();
    });
  });
