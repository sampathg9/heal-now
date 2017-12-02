'use strict';

// Third party modules
const nconf = require('nconf');
const path = require('path');

function Config() {
  // Get the environment
  let environment = process.env.NODE_ENV || 'development';
  // Order of loading configuration
  // 1. Command line arguments
  // 2. Environment variables
  // 3. Configuration from specified JSON file
  nconf.argv().env().file({
    file: path.join('config', `${environment}.json`),
    logicalSeparator: '.'
  });
  // Default configuration file
  nconf.file('default', 'config/default.json');
}

// Wrapper function around nconf to get configuration settings
Config.prototype.get = function (key) {
  if (!key) {
    return null;
  }
  return nconf.get(key);
};

// Export the module
module.exports = new Config();