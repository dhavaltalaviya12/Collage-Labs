var fs = require('fs');

fs.exists('C:\\Collage-Labs\\Web_Technology\\Lab 17',(exists)=>{
    console.log((exists) ? 'Found' : 'Not Found' );
})

fs.stat('Circle.js',(err,data)=>{
    console.log(data);
});

fs.readFile('abc.txt',(err,data) => {
    console.log(data.toString());
})

fs.writeFile('abc.txt','Dhaval Talaviya',(err,data) => {
    fs.readFile('abc.txt',(err,data) => {
        console.log(data.toString());
    })
})

fs.unlink('xyz.txt',(err) => {
    console.log("File Deleted");
})

fs.rename('abc.txt','dhaval.txt',(err) => {
    console.log("Rename Done")
})

var child_process = require('child_process')
child_process.exec('abc.txt',(err,stdout,stdin) => {
    console.log(stdout);
})

