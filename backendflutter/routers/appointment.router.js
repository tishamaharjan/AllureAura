const approuter = require('express').Router(); // Importing router object from express library
const appointmentController = require('../controller/appointment.controller');

//API for appointment
// Route for creating new appointment in database
approuter.post('/appointment', appointmentController.create);

// Route to get all appointments
// router.get('/appointment', appointmentController.getAll);

// // Route to get a specific appointment 
// router.get('/appointment/:id', appointmentController.getById);

// // // Route to update an appointment
// // router.put('/appointments/:id', appointmentController.update);

// // Route to delete an appointment
// router.delete('/appointment/:id', appointmentController.delete);

module.exports = approuter;
