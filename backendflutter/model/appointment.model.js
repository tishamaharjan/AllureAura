const mongoose = require('mongoose');
const db = require('../config/db');

const { Schema } = mongoose;

const appointmentSchema = new Schema({
    username:{
        type: String, 
        
    },
    chosenService:{
        type: String, 
        
    },
    chosenServiceType:{
        type: String, 
    
    },
    chosenServicePrice:{
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
    chosenTime: {
        type: String,
       
    },
    totalPrice: {
        type: Number,
    },

});

const waitingSchema = new Schema({
    username:{
        type: String, 
        
    },
    chosenService:{
        type: String, 
        
    },
    chosenServiceType:{
        type: String, 
    
    },
    chosenServicePrice:{
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
    chosenTime: {
        type: String,
       
    },
    totalPrice: {
        type: Number,
    },

});

const courseSchema = new Schema({
    username:{
        type: String, 
        
    },
    chosenService:{
        type: String, 
        
    },  
    totalPrice: {
        type: Number,
    },
});


const completeAppointmentSchema = new Schema({
    username:{
        type: String, 
        
    },
    chosenService:{
        type: String, 
        
    },
    chosenServiceType:{
        type: String, 
    
    },
    chosenServicePrice:{
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
    chosenTime: {
        type: String,
       
    },
    totalPrice: {
        type: Number,
    },
    feedback: {
        type: String,
    },

});

const appointmentModel = db.model('Appointment', appointmentSchema);
const waitingModel = db.model('Waiting', waitingSchema);
const courseModel = db.model('Course', courseSchema);
const completedAppointmentModel = db.model('CompletedAppointment', completeAppointmentSchema);

module.exports = {
    appointmentModel,
    waitingModel,
    courseModel,
    completedAppointmentModel
};