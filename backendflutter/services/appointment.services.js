const { appointmentModel, courseModel, completedAppointmentModel} = require('../model/appointment.model'); 
 
class appointmentService {
    // Creating a new appointment
    static async createAppointment(username,chosenService,chosenServiceType,chosenServicePrice,service,homeServicePrice,urgentBook,urgentBookPrice,selectedDate,chosenTime,totalPrice) {
        try {
            // Creating instance for new appointment 
            const appointment = new appointmentModel({username,chosenService,chosenServiceType,chosenServicePrice,service,homeServicePrice,urgentBook,urgentBookPrice,selectedDate,chosenTime,totalPrice});
            
            return await appointment.save(); 
        } catch (err) {
            throw err;
        }
    }

    // Creating a new course appointment
    static async createCourseAppointment(username,chosenService,totalPrice) {
        try {
            // Creating instance for new course appointment 
            const courseAppointment = new courseModel({username,chosenService,totalPrice});
            
            return await courseAppointment.save(); 
        } catch (err) {
            throw err;
        }
    }


    // Gettnig all appointments from database
    static async getAllAppointments() {
        try {
            const appointments = await appointmentModel.find();
            return appointments;
        } catch (err) {
            console.error('Error fetching all appointments:', error);
            throw err;
        }
    }


    // Gettnig all booked course details from database
    static async getAllCourses() {
        try {
            const courses = await courseModel.find();
            return courses;
        } catch (err) {
            console.error('Error fetching all appointments:', error);
            throw err;
        }
    }

    // Completion of an appointment
    static async completeAppointment(updatedAppointment) {
        console.log('Received appointment ID:',updatedAppointment.id);
        try {
            // Find the appointment details by ID in the main appointments collection from database
            const appointment = await appointmentModel.findById(updatedAppointment.id);
           
            if (!appointment) {
                throw new Error('Appointment not found');
            }

            // Saving appointment details to new collection completed appointments in database
            const completedAppointment = new completedAppointmentModel(
                {
                id: updatedAppointment.id,
                username: appointment.username,
                chosenService: appointment.chosenService,
                chosenServiceType: appointment.chosenServiceType,
                chosenServicePrice: appointment.chosenServicePrice,
                service: appointment.service,
                homeServicePrice: appointment.homeServicePrice,
                urgentBook: appointment.urgentBook,
                urgentBookPrice: appointment.urgentBookPrice,
                selectedDate: appointment.selectedDate,
                chosenTime: appointment.chosenTime,
                totalPrice: appointment.totalPrice,
                feedback: updatedAppointment.feedback,}
            );
         
            await completedAppointment.save();

            // Dlete the appointment from the appointment collection as it is marked as completed
            await appointmentModel.findByIdAndDelete(updatedAppointment.id);

            return completedAppointment;
            
        } catch (error) {
            console.error('Error completing appointment:', error);
            throw error;
        }
    }
    // Getting appointment details using ID
    static async findById(id) {
        try {
            return await appointmentModel.findById(id);
        } catch (error) {
            console.error('Error finding appointment by ID:', error);
            throw error;
        }
    }

    // Geting all completed appointments
    static async getAllCompletedAppointments() {
        try {
            const completedAppointments = await completedAppointmentModel.find();
            return completedAppointments;
        } catch (error) {
            console.error('Error fetching all completed appointments:', error);
            throw error;
        }
    }

    // Deleting an appointment using ID
    static async deleteAppointmentById(id) {
        try {
            console.log(`Attempting to delete appointment with ID: ${id}`);
            const deletedAppointment = await appointmentModel.findByIdAndDelete(id);

            if (!deletedAppointment) {
                console.error(`Appointment not found with ID: ${id}`);
                throw new Error('Appointment not found');
            }
        
            console.log(`Appointment deleted successfully with ID: ${id}`);
            return deletedAppointment;
        } catch (error) {
            console.error('Error deleting appointment:', error);
            throw error;
        }
    }
}

module.exports = appointmentService;
