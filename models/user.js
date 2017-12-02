'use strict';

// Internal modules
const DB = require('../lib/db.js');

function User() {
  this.db = new DB();
}

User.prototype.login = function (options, cb) {
  let query = `SELECT COUNT(*) FROM users WHERE email = :username AND password = :password;`;
  this.db.getResult({
    query: query,
    data: options
  }, function (err, result) {
    if (err) {
      return cb(err);
    }
    return cb(null, result);
  });
};

module.exports = User;