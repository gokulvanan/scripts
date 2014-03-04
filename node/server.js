#!/usr/bin/env node

var http = require('http');
http.createServer(function (req, res) {
    res.writeHead(200, {'Content-Type': 'application/json'});
    var body;
    if(req.method === 'POST'){
      var body = '';
      req.on('data', function (data) {
          body += data;
      });
      req.on('end', function () {
        var bdy = JSON.parse(body);
        console.log("incoming req");
        console.log(bdy);
      });
    }
    var output ={
      status:"Success",
      message:"Done",
      data:null
    };
    console.log("Sending response");
    console.log(output);
    res.end(JSON.stringify(output));
}).listen(8081, '127.0.0.1');
console.log('Server running at http://127.0.0.1:8081/');
