const mongoose = require('mongoose');

const Faculty = mongoose.Schema({
    FacultyId : Number,
    FacultyName : String,
    FacultyInitial : String
});

module.exports = mongoose.model("Faculty",Faculty);