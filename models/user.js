'use strict';

// Third party modules
const async = require('async');
const uuidv1 = require('uuid/v1');
const moment = require('moment');

// Internal modules
const DB = require('../lib/db.js');

function User() {
  this.db = new DB();
}

User.prototype.login = function (options, cb) {
  let that = this;
  async.waterfall([
    function (next) {
      let query = `SELECT id FROM users WHERE email = :username AND password = :password AND status = :status LIMIT 1;`;
      that.db.getResult({
        query: query,
        data: options
      }, function (err, result) {
        if (err) {
          return cb(err);
        }
        return next(null, result);
      });
    },
    function (data, next) {
      let query = `INSERT INTO user_tokens (user_id, token, expire_on) VALUES (?, ?, ?);`;
      let userId = data.id;
      let token = uuidv1();
      let tokenExpiry = moment().utc().add(1, 'y').format('YYYY-MM-DD HH:mm:ss');
      that.db.query({
        query: query,
        data: [userId, token, tokenExpiry]
      }, function(err, result) {
        if(err) {
          return cb(err);
        }
        if(result.insertId) {
          let response = {
            'user_id': userId,
            'token': token
          };
          return next(null, response);
        }
        return cb(new Error('There is an error while generating the token.'));
      });
    }
  ], function(err, data) {
    if(err) {
      return cb(err);
    }
    return cb(null, data);
  });
};

module.exports = User;