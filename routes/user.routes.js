const express = require('express');
const router = express.Router();
const UserController = require('../controllers/user.controller');
const verify = require('../middlewares/verify');

// http://localhost:3000
router.post('/register', UserController.register);
router.post('/login', UserController.login);
router.get('/secret', UserController.getSecret);

module.exports = router;