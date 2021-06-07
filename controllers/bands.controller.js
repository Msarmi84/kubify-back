const connection = require("../config/db");

class BandsController {
    getBand = (req, res) => {
        const sql = `SELECT * FROM band`;
        connection.query(sql, (error, results) => {
            if (error) {
                console.log(error);
                res.status(400).json({ error });
            } else {
                let r = JSON.stringify(results);
                r = JSON.parse(r);
                res.status(200).json(r);
            }
        });
    };


    getBandById = (req, res) => {
        const sql = `SELECT * FROM band WHERE id= ${req.params.id}`;
        connection.query(sql, (error, results) => {
            if (error) {
                console.log(error);
                res.status(400).json({ error });
            } else {
                res.status(200).json(results[0]);
            }
        });
    };

    postSearchBand = (req, res) => {
        console.log(req.body);
        this.makeSearch(req, res, req.body);
    };


    makeSearch = (req, res, p) => {
        const sql = `SELECT * FROM band WHERE name like '%${p.name}%'`;

        connection.query(sql, (error, results) => {
            if (error) {
                console.log(error);
                res.status(400).json({ error });
            } else {
                let r = JSON.stringify(results);
                r = JSON.parse(r);
                res.status(200).json(r);
            }
        });
    };

    addBand = (req, res) => {
        const { name, description } = req.body;
        let sql = `INSERT INTO band (name, description) VALUES ('${name}','${description}')`;

        if (req.file) {
            sql = `INSERT INTO band (name, description, img) 
        VALUES ('${name}', '${description}', '${req.file.filename}')`;
        }

        connection.query(sql, (error, results) => {
            if (error) {
                console.log(error);
                res.status(400).json({ error });
            } else {
                console.log(results);
                req.params.id = results.insertId;
                this.getBandById(req, res);
            }
        });
    };

    updateBand = (req, res) => {
        const { name, description } = req.body;
        let sql = `UPDATE band SET name = '${name}', description = '${description}' WHERE id = '${req.params.id}'`;

        if (req.file) {
            sql = `UPDATE band SET name = '${name}', description = '${description}',
           img = '${req.file.filename}' WHERE id = '${req.params.id}'`;
        }

        connection.query(sql, (error, results) => {
            if (error) {
                console.log(error);
                res.status(400).json({ error });
            } else {
                this.getBandById(req, res);
            }
        });
    };

    deleteBand = (req, res) => {
        const sql = `DELETE FROM band WHERE id= ${req.params.id}`;
        connection.query(sql, (error, results) => {
            if (error) {
                console.log(error);
                res.status(400).json({ error });
            } else {
                console.log(results);
                res.status(200).json();
            }
        });
    };


}

module.exports = new BandsController();