var http = require('http')

var server = http.createServer((req, res) => {
    res.statusCode = 200;
    res.setHeader('Contact-Type', 'text/html');

    if (req.url == '/home') {
        res.end('<h1>Hello from Home</h1>');
    }
    else if (req.url == '/about') {
        res.end('<h1>I am Dhaval Talaviya</h1>');
    }
    else if (req.url == '/contact') {
        res.end('<h1>My Contact Number is 9876543210</h1>');
    }
    else{
        res.end('<h1>hello World</h1>');
    }


     
});

server.listen(3000, () => {
    console.log('Server running at http://10.20.54.7')
})

