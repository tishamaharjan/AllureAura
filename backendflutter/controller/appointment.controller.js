const appointmentService = require('../services/appointment.services'); // Import the Appointment model

// Create a new appointment
const create = async (req, res, next) => {
    try {
        // Extract appointment details
        const { username, choosedService, choosedServiceType, choosedServicePrice, service, homeServicePrice, urgentBook, urgentBookPrice, selectedDate, choosedTime, totalPrice } = req.body;
        console.log('Received request data:', req.body);
        const appointment = await appointmentService.createAppointment(username, choosedService, choosedServiceType, choosedServicePrice, service, homeServicePrice, urgentBook, urgentBookPrice, selectedDate, choosedTime, totalPrice);

        res.status(201).json({ status: true, success: 'Appointment created successfully' });
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

// Get all appointments from database
const getAll = async (req, res) => {
    try {
        const appointments = await appointmentService.getAllAppointments();
        res.json(appointments);
    } catch (error) {
        console.error('Error fetching all appointments:', error);
        res.status(500).json({
            status: false,
            message: 'Error retrieving appointments',
            error,
        });
    }
};

// Function for completed appointment
const completeAppointment = async (req, res) => {
    try {
        console.log('Received request body:', req.body);
        const updatedAppointment = req.body;
        if (!updatedAppointment.id) {
            return res.status(400).json({ message: 'Missing appointment ID.' });
        }

        const completedAppointment = await appointmentService.completeAppointment(updatedAppointment);

        res.status(200).json({ message: 'Appointment completed and moved to completed appointments collection', completedAppointment, });
    } catch (error) {
        if (error.message === 'Appointment not found') {
            res.status(404).json({ message: 'Appointment not found' });
            console.error(`Error completing appointment with ID ${req.params.id}:`, error);
        } else {
            console.error('Error completing appointment:', error);
            res.status(500).json({ message: 'Error completing appointment', error });
        }
    }
};

// Get all completed appointments
const getAllCompleted = async (req, res, next) => {
    try {
        const completedAppointments = await appointmentService.getAllCompletedAppointments();
        res.status(200).json(completedAppointments);
    } catch (error) {
        console.error('Error fetching all completed appointments:', error);
        res.status(500).json({ error: 'Internal server error' });
    }
}



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

// Delete an appointment by ID
const remove = async (req, res) => {
    try {
        const id = req.params.id;

        // Delete the appointment using the ID
        const deletedAppointment = await appointmentService.deleteAppointmentById(id);


        if (!deletedAppointment) {
            return res.status(404).json({ message: 'Appointment not found', deletedAppointment });
        }

        // Send success response
        res.status(200).json({
            message: 'Appointment deleted successfully',
        });
    } catch (error) {
        res.status(500).json({ message: 'Error deleting appointment', error });
    }
};

module.exports = {
    create,
    getAll,
    completeAppointment,
    getAllCompleted,
    // update,
    remove,
};
