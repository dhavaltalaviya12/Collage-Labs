const express = require('express');
const app = express();
const bodyParser = require('body-parser');

const a = [
    {
        id: 1,
        name: 'Dhaval'
    },
    {
        id: 2,
        name: 'Nandan'
    },
    {
        id: 3,
        name: 'Jevin'
    },
];

app.get('/students', (req, res) => {
    res.json(a);
});

app.use(bodyParser.urlencoded({ extended: false }));
app.post('/students/', (req, res) => {
    const obj =
    {
        id: a.length + 1,
        name: req.body.name
    }
    a.push(obj)
    res.json(a)
});

app.delete('/students/:id', (req, res) => {
    const data = a.splice(req.params.id, 1)
    res.json(data);
});

app.put('/students/:id', (req, res) => {
    a[req.params.id].name = req.body.name;
    res.json(a)
});

app.listen(3000, () => {
    console.log('Server Started')
});