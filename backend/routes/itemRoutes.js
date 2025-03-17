const express = require('express');
const router = express.Router();
const { getItems, getItemById } = require('../controllers/itemController');
const { protect } = require('../middleware/auth');

router.get('/', getItems);
router.get('/:id', getItemById);

module.exports = router;