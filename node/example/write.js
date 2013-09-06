
var fs = require("fs");

module.exports = {
  write: function ( filename, data ){
    // write to file synchronusly
    fs.writeFileSync( filename, data );
  }
};

