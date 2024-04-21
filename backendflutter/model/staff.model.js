const mongoose = require('mongoose');
const db = require('../config/db');

//const { Schema } = mongoose; 
const staffSchema = new mongoose.Schema({
    staffId: {
        type: String,
        lowercase: true,
        unique: true,
    },
    staffname: {
        type: String,
        lowercase: true,
        
    },
    email: {
        type: String,
        lowercase: true,
        unique: true,
    },
    address: {
        type: String,
        lowercase: true,
       
    },
    phoneNumber: {
        type: String,
        lowercase: true,
        unique: true,
    },
});

const staffModel = db.model('Staff', staffSchema);

module.exports = staffModel;
