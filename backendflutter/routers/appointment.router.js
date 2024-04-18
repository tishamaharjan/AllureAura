const approuter = require('express').Router(); // Importing router object from express library
const cors = require('cors');

const appointmentController = require('../controller/appointment.controller');

// Configure and apply CORS to this router
const corsOptions = {
    origin: 'http://localhost:3000', // Allow requests from the front-end origin
    methods: ['POST','GET'], // Specify allowed methods (in this case, POST for login)
    credentials: true, // Allow credentials (e.g., cookies)
};

// Apply CORS middleware to this router
approuter.use(cors(corsOptions));

//API for appointment
// Route for creating new appointment in database
approuter.post('/appointment', appointmentController.create);

// Route to get all appointments
approuter.get('/appointment', appointmentController.getAll);

// Route to for completed appointments
approuter.post('/appointment/complete', appointmentController.completeAppointment);
approuter.get('/appointment/complete', appointmentController.getAllCompleted);


// Route to delete an appointment
approuter.delete('/appointment/:id', appointmentController.remove);

module.exports = approuter;
