var s = require('./Circle')
console.log(s.area(20))

var path = require('path')
var a = path.join('Dhaval','Talaviya')
console.log(a)

var b = path.resolve('Lab 17','Js code')
console.log(b)

var c = path.relative('WT/name','WT/surname')
console.log(c)

var d = path.dirname('abc/name.js')
console.log(d)

var e = path.basename('abc/name.js')
console.log(e)

var f = path.extname('abc/name.js')
console.log(f)