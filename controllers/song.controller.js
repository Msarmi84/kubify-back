const connection = require("../config/db");

class SongController {


    getSongs = (req, res) => {

        const sql = `SELECT * FROM song`;
        connection.query(sql, (error, results) => {
            if (error) {
                console.log(error);
                res.status(400).json({ error });
            } else {
                res.status(200).json(results);
            }
        });
    };


    getSongsByUserId = (req, res) => {

        const user_id = req.params.user_id;
        const sql = `SELECT * FROM song WHERE id = ${id}`;

        connection.query(sql, (error, results) => {
            if (error) {
                console.log(error);
                res.status(400).json({ error });
            } else {
                res.status(200).json(results);
            }
        });
    }


}


module.exports = new SongController();