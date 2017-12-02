'use strict';

// DB helper class to perform database
// operations on MariaDB from NodeJS app

// Third party modules
const mariasql = require('mariasql');

// Configuration
const config = require('../config');

// Create client
console.log(config);
let client = new mariasql({
  'host': config.get('db.host'),
  'user': config.get('db.user'),
  'password': config.get('db.pwd'),
  'db': config.get('db.name')
});

/**
 * @namespace DB
 */
function DB() {

}

/**
 * @name query
 * @desc Executes INSERT, UPDATE and DELETE statements
 * @param {object} queryObj
 * @param {string} queryObj.query
 * @param {object} queryObj.data
 * @param {callback} cb
 */
DB.prototype.query = function (queryObj, cb) {
  this.executeQuery(queryObj, function (err, response) {
    return cb(err, response);
  });
};

/**
 * @name getResults
 * @desc Executes SELECT statements
 * and returns multiple result set
 * @param {object} queryObj
 * @param {string} queryObj.query
 * @param {object} queryObj.data
 * @param {callback} cb
 */
DB.prototype.getResults = function (queryObj, cb) {
  queryObj.isSelect = true;
  this.executeQuery(queryObj, function (err, response) {
    return cb(err, response);
  });
};

/**
 * @name getResult
 * @desc Executes SELECT statements
 * and returns single result set
 * @param {object} queryObj
 * @param {string} queryObj.query
 * @param {object} queryObj.data
 * @param {callback} cb
 */
DB.prototype.getResult = function (queryObj, cb) {
  queryObj.isSelect = true;
  this.executeQuery(queryObj, function (err, response) {
    return cb(err, response[0]);
  });
};

/**
 * @name executeQuery
 * @desc Executes given SQL statements
 * and process the response from DB
 * @param {object} queryObj
 * @param {string} queryObj.query
 * @param {object} queryObj.data
 * @param {callback} cb
 */
DB.prototype.executeQuery = function (queryObj, cb) {
  let response = [];
  // Normalizing query object
  client.query(queryObj.query, queryObj.data)
    .on('result', cbHandleResult)
    .on('error', cbHandleError)
    .on('end', cbEnd)

  function cbHandleResult(res) {
    if (queryObj.isSelect) {
      res.on('data', function (row) {
        response.push(row);
      });
    }
    res.on('end', function () {
      if (!queryObj.isSelect) {
        cb(null, res.info);
      }
    });
  }

  function cbHandleError(err) {
    queryObj.hasError = true;
    cb(err);
  }

  function cbEnd() {
    if (!queryObj.hasError) {
      if (queryObj.isSelect) {
        cb(null, response);
      }
    }
  }
};

module.exports = DB;