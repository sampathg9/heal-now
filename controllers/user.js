'use strict';

// Internal modules
let User = require('../models/user.js');

function UserController() {
  this.mUser = new User();
}

UserController.prototype.register = function (req, res) {
  // Add registration code
};

UserController.prototype.login = function (req, res) {
  let options = {
    username: req.body.username,
    password: req.body.password
  };
  this.mUser.login(option, function (err, result) {
    Controller.sendResponse(err, result, response);
  });
};

module.exports = new UserController();