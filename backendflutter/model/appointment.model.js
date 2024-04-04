const mongoose = require('mongoose');

const appointmentSchema = new Schema({

})

const Appointment = mongoose.model('Appointment', appointmentSchema);
module.exports = Appointment;