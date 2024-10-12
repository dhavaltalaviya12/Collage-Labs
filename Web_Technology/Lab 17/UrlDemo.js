var url = require('url');
var add = 'https://github.com/abc.txt?FirstName=Dhaval&LastName=Talaviya';
var q = url.parse(add,true);

console.log(q.host);
console.log(q.pathname);
console.log(q.search);

var qdata = q.query;
console.log(qdata);
console.log(qdata.FirstName);