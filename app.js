const express = require('express');
const app = express();
require('dotenv').config();
const cors = require('cors');
const path = require('path');

// Routes 
const bandsRoutes = require('./routes/bands.routes');
const userRoutes = require('./routes/user.routes');
const songsRoutes = require('./routes/songs.routes');


// Middlewares 
app.use(cors());
app.use(express.json());
app.use(express.static(path.join(__dirname, 'public')));
app.use('/bands', bandsRoutes);
app.use('/user', userRoutes);
app.use('/songs', songsRoutes);



app.listen(3000, () => console.log('Server Running!!!'))