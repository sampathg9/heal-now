'use strict';

let Controller = require('./controller');
let DB = require('./db');

function Authorization() {

}

Authorization.prototype.validate = function (req, res, next) {
  let currToken = null;
  if (!req.headers.Authorization) {
    Controller.sendResponse(new Error('Please send a valid token.'), {}, res);
    return;
  }
  currToken = req.headers.Authorization;
  let db = new DB();
  let query = 'SELECT * FROM user_tokens WHERE token = ? and status = ?;';
  db.getResults({
    query: query,
    data: [currToken, 1],
    cb: function (err, result) {
      if (err) {
        return cb(err);
      }
      if (!result.length) {
        Controller.sendResponse(new Error('Please send a valid token.'), {}, res);
        return;
      }
      req.userId = result.user_id;
      return next();
    }
  })
};

module.exports = new Authorization();