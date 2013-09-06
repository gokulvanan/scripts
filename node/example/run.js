var reader = require('./read'), 
  writer = require('./write');

reader.read('./source.txt', function(data){

  var change = data.replace('I am','You are');
  reader.print(data);

  writer.write('./change.txt',change);
});
