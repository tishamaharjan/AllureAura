const appointmentService = require('../services/appointment.services'); // Import the Appointment model

// Create a new appointment
const create = async (req, res, next) => {
    try {
        // Extract appointment data from the request body
        const {username,choosedService,choosedServiceType,choosedServicePrice,service,homeServicePrice,urgentBook,urgentBookPrice,selectedDate,choosedTime,totalPrice} = req.body;
        console.log('Received request data:', req.body);
        const appointment = await appointmentService.createAppointment(username,choosedService,choosedServiceType,choosedServicePrice,service,homeServicePrice,urgentBook,urgentBookPrice,selectedDate,choosedTime,totalPrice);
        
        // Send success response
        res.status(201).json({status:true, success: 'Appointment created successfully'});
    } 
    
    catch (error) {
        console.error('Error creating appointment:', error);
        res.status(500).json({
            status: false,
            message: 'Error creating appointment',
            error,
        });
    }
};

// Get all appointments
// const getAll = async (req, res) => {
//     try {
//         // Get all appointments from the database
//         const appointments = await appointmentService.find();
        
//         // Send success response
//         res.status(200).json(appointments);
//     } catch (error) {
//         // Handle error and send error response
//         res.status(500).json({
//             message: 'Error retrieving appointments',
//             error,
//         });
//     }
// };

// // Get an appointment by ID
// const getById = async (req, res) => {
//     try {
//         const appointmentId = req.params.id;

//         // Find the appointment by ID
//         const appointment = await appointmentService.findById(appointmentId);

//         // Check if appointment exists
//         if (!appointment) {
//             return res.status(404).json({ message: 'Appointment not found' });
//         }

//         // Send success response
//         res.status(200).json(appointment);
//     } catch (error) {
//         // Handle error and send error response
//         res.status(500).json({
//             message: 'Error retrieving appointment',
//             error,
//         });
//     }
// };

// // Update an appointment by ID
// const update = async (req, res) => {
//     try {
//         const appointmentId = req.params.id;
//         const updatedData = req.body;

//         // Update the appointment using the ID
//         const updatedAppointment = await appointmentService.findByIdAndUpdate(
//             appointmentId,
//             updatedData,
//             { new: true }
//         );

//         // Check if appointment was found and updated
//         if (!updatedAppointment) {
//             return res.status(404).json({ message: 'Appointment not found' });
//         }

//         // Send success response
//         res.status(200).json({
//             message: 'Appointment updated successfully',
//             appointment: updatedAppointment,
//         });
//     } catch (error) {
//         // Handle error and send error response
//         res.status(500).json({
//             message: 'Error updating appointment',
//             error,
//         });
//     }
// };

// // Delete an appointment by ID
// const remove = async (req, res) => {
//     try {
//         const appointmentId = req.params.id;

//         // Delete the appointment using the ID
//         const deletedAppointment = await appointmentService.findByIdAndDelete(appointmentId);

//         // Check if appointment was found and deleted
//         if (!deletedAppointment) {
//             return res.status(404).json({ message: 'Appointment not found' });
//         }

//         // Send success response
//         res.status(200).json({
//             message: 'Appointment deleted successfully',
//         });
//     } catch (error) {
//         // Handle error and send error response
//         res.status(500).json({
//             message: 'Error deleting appointment',
//             error,
//         });
//     }
//};

module.exports = {
    create,
    // getAll,
    // getById,
    // update,
    // remove,
};
