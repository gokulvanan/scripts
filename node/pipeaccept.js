
var data='';

var i =  setInterval(function(){
  console.log("working");
},100);

process.stdin.resume();
process.stdin.setEncoding('utf8');

process.stdin.on('data', function(chunk){
  console.log(chunk);
  data += chunk;
});

process.stdin.on('end',function(){
  console.log("data from piped stream");
  console.log(data);
  clearInterval(i);
});



