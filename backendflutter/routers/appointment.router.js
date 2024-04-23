const approuter = require('express').Router(); // Importing router object from express library
const cors = require('cors');

const appointmentController = require('../controller/appointment.controller');

// Configuring and applying CORS to approuter
const corsOptions = {
    origin: 'http://localhost:3000', 
    methods: ['POST','GET','DELETE'], 
    credentials: true, 
};

approuter.use(cors(corsOptions));

//API for appointment
approuter.post('/appointment', appointmentController.create);
approuter.get('/appointment', appointmentController.getAll);

//API for waiting list
approuter.post('/waitinglist', appointmentController.createWaitingList);
approuter.get('/waitinglist', appointmentController.getAllWait);

//API for booking course
approuter.post('/course', appointmentController.createCourse);
approuter.get('/course', appointmentController.getAllCourse);

// API for completed appointments
approuter.post('/appointment/complete', appointmentController.completeAppointment);
approuter.get('/appointment/complete', appointmentController.getAllCompleted);

// API to delete an appointment
approuter.delete('/appointment/:id/complete', appointmentController.remove);

module.exports = approuter;
