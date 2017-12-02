'use strict';

// Configuration
const config = require('./config');
const API_URL_KEY = config.get('api_url_key');

// Authorization handler
let Authorization = require('./lib/authorization');

// Controllers
let UserController = require('./controllers/user.js');
// let AppointmentController = require('controllers/appoinment.js');
// let DocumentController = require('controllers/document.js');

function Router(app) {
  // Users
  app.post(`${API_URL_KEY}/register`, Authorization.validate, UserController.register);
  app.post(`${API_URL_KEY}/login`, UserController.login);

};

module.exports = Router;