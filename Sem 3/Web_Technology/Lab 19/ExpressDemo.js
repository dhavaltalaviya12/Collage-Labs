var express = require('express');
var ex = express();

ex.get('/',(req,res) => {
    res.setHeader('Contact-Type', 'text/html');
    res.send(
        `
        <a href = "home" target="_blank"><button>Home</button></a>
        <a href = "about" target="_blank"><button>About</button></a>
        <a href = "contact" target="_blank"><button>Contact</button></a>
        `
    );
});

ex.get('/home',(req,res) => {
    res.send('<h1>Hello From Home</h1>');    
});

ex.get('/about',(req,res) => {
    res.send('<h1>I am Dhaval Talaviya</h1>');
});

ex.get('/contact',(req,res) => {
    res.send('<h1>My Contact ...............</h1>');
});

ex.listen(3000, () => {
    console.log('Server running at http://10.20.54.7')
});
