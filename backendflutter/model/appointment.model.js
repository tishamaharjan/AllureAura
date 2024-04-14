const mongoose = require('mongoose');
const db = require('../config/db');

const { Schema } = mongoose;

const appointmentSchema = new Schema({
    username:{
        type: String, 
        
    },
    choosedService:{
        type: String, 
        
    },
    choosedServiceType:{
        type: String, 
    
    },
    choosedServicePrice:{
        type: Number, 
       
    },
    service:{
        type: String, 
        
    },
    homeServicePrice:{ 
        type: Number, 
       
    },
    urgentBook: {
        type: String, 
        
    },
    urgentBookPrice: {
        type: Number, 
       
        },
    selectedDate: {
        type: String,
        
    },
    choosedTime: {
        type: String,
       
    },
    totalPrice: {
        type: Number,
        //required: true,
    },

})

const appointmentModel = db.model('Appointment', appointmentSchema);
module.exports = appointmentModel;