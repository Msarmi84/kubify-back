const express = require('express');
const router = express.Router();
const songController = require('../controllers/song.controller');

//localhost:3000/
router.get('/', songController.getSongs);
router.get('/allSongs/:id', songController.getSongsByUserId);


module.exports = router;