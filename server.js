'use strict';

// Third party modules
const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');

// Configuration
const config = require('./config');

// Initialize the app
const app = express();

// Middlewares
app.use(cors());
app.use(bodyParser.json());

// Initialize the routes
require('./routes')(app);

app.listen(config.get('port'), function (err) {
  if (err) {
    console.log(err);
    return;
  }
  console.log(`Server is running on localhost:${config.get('port')}`);
});

