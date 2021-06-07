const express = require('express');
const router = express.Router();
const bandsController = require('../controllers/bands.controller');
const upload = require('../middlewares/multer');
const verify = require('../middlewares/verify');

//localhost:3000/
router.get('/', bandsController.getBand);
router.get('/:id', verify, bandsController.getBandById);
router.post('/', upload, verify, bandsController.addBand);
router.put('/:id', verify, upload, bandsController.updateBand);
router.delete('/:id', bandsController.deleteBand);
router.post('/buscar', bandsController.postSearchBand);


module.exports = router;