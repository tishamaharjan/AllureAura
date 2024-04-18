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
const getAll = async (req, res) => {
    try {
        // Get all appointments from the database
        const appointments = await appointmentService.getAllAppointments();
        
        // Send success response
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

// Function to handle appointment completion
const completeAppointment = async (req, res) => {
    try {
        console.log('Received request body:', req.body);
        const {appointmentID} = req.body;

        // if (!appointmentID) {
        //     return res.status(400).json({ message: 'Appointment ID is missing or invalid' });
        // }

        // Complete the appointment using the ID
        const completedAppointment = await appointmentService.completeAppointment(appointmentID);

        // If the appointment was successfully completed, send a success response
        res.status(200).json({ message: 'Appointment marked as completed and moved to completed appointments collection' });
    } catch (error) {
        
        if (error.kind === 'ObjectId') {
            res.status(400).json({ message: 'Invalid appointment ID format' });
        } 
                // If the appointment is not found, return a 404 Not Found response
        else if (error.message === 'Appointment not found') {
            res.status(404).json({ message: 'Appointment not found' });
            console.error(`Error completing appointment with ID ${req.params.id}:`, error);
        } else {
            // Handle other errors and respond with a 500 Internal Server Error
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
        res.status(500).json({message: 'Error deleting appointment',error});
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
