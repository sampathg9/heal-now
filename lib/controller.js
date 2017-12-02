'use strict';

function Controller() {

}

Controller.prototype.sendResponse = function (err, data, response) {
  if (err) {
    console.log(err);
    response.format({
      'application/json': function () {
        response.status(500).json({
          'status': 'fail',
          'data': {},
          'message': err.message
        });
      }
    });
  } else {
    response.format({
      'application/json': function () {
        response.status(200).json({
          'status': 'success',
          'data': data,
          'message': ''
        });
      }
    });
  }
};

module.exports = new Controller();