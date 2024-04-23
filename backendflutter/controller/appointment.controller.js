const appointmentService = require('../services/appointment.services'); // Import the Appointment model

// Creating a new appointment
const create = async (req, res, next) => {
    try {
        // Extracting appointment details
        const { username,chosenService,chosenServiceType,chosenServicePrice,service,homeServicePrice,urgentBook,urgentBookPrice,selectedDate,chosenTime,totalPrice } = req.body;
        console.log('Received request data:', req.body);
        const appointment = await appointmentService.createAppointment(username,chosenService,chosenServiceType,chosenServicePrice,service,homeServicePrice,urgentBook,urgentBookPrice,selectedDate,chosenTime,totalPrice);

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

const createWaitingList = async (req, res, next) => {
    try {
        // Extracting appointment details
        const { username,chosenService,chosenServiceType,chosenServicePrice,service,homeServicePrice,urgentBook,urgentBookPrice,selectedDate,chosenTime,totalPrice } = req.body;
        console.log('Received request data:', req.body);
        const waitingList = await appointmentService.createWaitingList(username,chosenService,chosenServiceType,chosenServicePrice,service,homeServicePrice,urgentBook,urgentBookPrice,selectedDate,chosenTime,totalPrice);

        res.status(201).json({ status: true, success: 'Waitinglist created successfully' });
    }

    catch (error) {
        console.error('Error creating waitinglist:', error);
        res.status(500).json({
            status: false,
            message: 'Error creating waitinglist',
            error,
        });
    }
};

// Creating new course appointment
const createCourse = async (req, res, next) => {
    try {
        // Extract appointment details of course
        const { username, chosenService, totalPrice } = req.body;
        console.log('Received request course:', req.body);
        const courseAppointment = await appointmentService.createCourseAppointment(username, chosenService, totalPrice);

        res.status(201).json({ status: true, success: 'Course appointment created successfully' });
    }

    catch (error) {
        console.error('Error creating course appointment:', error);
        res.status(500).json({
            status: false,
            message: 'Error creating course appointment',
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

// Get all waitinglist from database
const getAllWait = async (req, res) => {
    try {
        const waitingList = await appointmentService.getAllWaitingList();
        res.json(waitingList);
    } catch (error) {
        console.error('Error fetching all waitinglist:', error);
        res.status(500).json({
            status: false,
            message: 'Error retrieving waiting list',
            error,
        });
    }
};

const getAllCourse = async (req, res) => {
    try {
        const courseDetails = await appointmentService.getAllCourses();
        res.json(courseDetails);
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

// Delete the appointment using ID
const remove = async (req, res) => {
    try {
        const id = req.params.id;
        const deletedAppointment = await appointmentService.deleteAppointmentById(id);

        if (!deletedAppointment) {
            return res.status(404).json({ message: 'Appointment not found', deletedAppointment });
        }

        res.status(200).json({
            message: 'Appointment deleted successfully',
        });
    } catch (error) {
        res.status(500).json({ message: 'Error deleting appointment', error });
    }
};

module.exports = {
    create,
    createWaitingList,
    createCourse,
    getAll,
    getAllWait,
    getAllCourse,
    completeAppointment,
    getAllCompleted,
    remove,
};
