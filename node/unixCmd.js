
var sys = require('sys');
var exec = require('child_process').exec;
var child;

// execute pwd
child = exec('pwd', function (error, stdout, stderr){
  sys.print('stdout '+stdout);
  sys.print('stderr '+stderr);
  if(error !== null){
    console.log("error "+error);
  }
});




