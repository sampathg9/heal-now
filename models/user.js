'use strict';

// Internal modules
const DB = require('../lib/db.js');

function User() {
  this.db = new DB();
}

User.prototype.login = function (options, cb) {
  let query = `SELECT COUNT(*) FROM user_m WHERE email = :email AND password = :password;`;
  this.db.getResult({
    query: query,
    data: options,
    cb: function (err, result) {
      if (err) {
        return cb(err);
      }
      return cb(null, result);
    }
  });
};

module.exports = User;