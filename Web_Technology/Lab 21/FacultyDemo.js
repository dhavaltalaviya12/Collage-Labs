const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');
const Faculty = require('./Faculty.js');

mongoose.connect("mongodb+srv://Dhvl1209:Dhvl1209@dhaval1209.hp1n5.mongodb.net/")
    .then(() => {
        const app = express();
        app.use(bodyParser.urlencoded({ extended: false }))

        app.get('/faculties', async (req, res) => {
            const ans = await Faculty.find();
            res.send(ans);
        })

        app.get('/faculties/:id', async (req, res) => {
            const ans = await Faculty.findOne({ FacultyId: req.params.id });
            res.send(ans);
        })

        app.post('/faculties', async (req, res) => {
            Fact = new Faculty({ ...req.body });
            const ans = await Fact.save();
            res.send(ans);
        })

        app.delete('/faculties/:id', async (req, res) => {
            const ans = await Faculty.deleteOne({ FacultyId: req.params.id });
            res.send(ans);
        })

        app.patch('/faculties/:id', async (req, res) => {
            const Fact = await Faculty.findOne({ FacultyId: req.params.id });
            console.log(Fact)

            Fact.FacultyId = req.body.FacultyId
            Fact.FacultyName = req.body.FacultyName
            Fact.FacultyInitial = req.body.FacultyInitial
            await Fact.save();
            res.send(Fact);
        })

        app.listen(3000, () => {
            console.log("Server Started")
        })
    })