const connection = require('../config/db');
const sha1 = require('sha1');
const jwt = require('jsonwebtoken');

class UserController {

    register = (req, res) => {
        const { email, password } = req.body;
        const hashedPassword = sha1(password);
        const sql = `INSERT INTO user (email, password) VALUES ('${email}', '${hashedPassword}')`;
        this.createConnection(sql, 201, res)
    }

    login = (req, res) => {
        const { email, password } = req.body;
        const sql = `SELECT email, password FROM user WHERE email = '${email}'`;
        connection.query(sql, (error, result) => {

            // en caso de error en la base de datos 
            if (error) {
                console.log(error);
                return res.status(400).json(error);
            }

            // en caso de no encontrar ningún resultado en la query 
            if (!result || !result.length) {
                return res.status(401).json('User not found');
            }

            // en caso de que las creenciales sean falsas
            const hashedPassword = password;
            const [user] = result;
            if (user.password !== hashedPassword) {
                return res.status(401).json('Invalid password');
            }

            // en caso de pasar todos los filtros anteriores, creamos el token (tienes que tener instalado npm install jsonwebtoken)
            const token = jwt.sign({ user: { username: user.username, email: user.email } },
                process.env.SECRET, { expiresIn: '1h' }
            );

            return res.status(200).json({ token });
        })
    }


    getSecret = (req, res) => {
        console.log(req.body.user);
        return res.status(200).json({ secret: 'SECRETUS MAXIMUS' });
    }

    createConnection(query, statusCode, res) {
        connection.query(query, (error, results) => {
            if (error) {
                console.log(error);
                res.status(400).json({ error });
            } else {
                res.status(statusCode).json(results);
            }
        });
    }
}

module.exports = new UserController();