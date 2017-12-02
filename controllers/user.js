'use strict';

// Internal modules
let User = require('../models/user.js');
let Controller = require('../lib/controller.js');

function UserController() {
  
}

UserController.prototype.register = function (req, res) {
  // Add registration code
};

UserController.prototype.login = function (req, res) {
  let options = {
    username: req.body.username,
    password: req.body.password,
    status: 1
  };
  let mUser = new User();
  mUser.login(options, function (err, result) {
    Controller.sendResponse(err, result, res);
  });
};

module.exports = new UserController();