const { appointmentModel, completedAppointmentModel } = require('../model/appointment.model'); 

class appointmentService {
    // Create a new appointment
    static async createAppointment(username,choosedService,choosedServiceType,choosedServicePrice,service,homeServicePrice,urgentBook,urgentBookPrice,selectedDate,choosedTime,totalPrice) {
        try {
            // Create new appointment instance
            const appointment = new appointmentModel({username,choosedService,choosedServiceType,choosedServicePrice,service,homeServicePrice,urgentBook,urgentBookPrice,selectedDate,choosedTime,totalPrice});
            
            return await appointment.save(); // Saving the appointment details to the database
        } catch (err) {
            throw err;
        }
    }

    

    // Get all appointments
    static async getAllAppointments() {
        try {
            // Retrieve all appointments from the database
            const appointments = await appointmentModel.find();
            return appointments;
        } catch (err) {
            console.error('Error fetching all appointments:', error);
            throw err;
        }
    }

    // Complete an appointment
    static async completeAppointment(updatedAppointment) {
        console.log('Received appointment ID:',updatedAppointment.id);
        try {
            // Find the appointment by ID in the main appointments collection
            const appointment = await appointmentModel.findById(updatedAppointment.id);
           
            if (!appointment) {
                throw new Error('Appointment not found');
            }

            // Convert the appointment document to an object and save it to the completed appointments collection
            const completedAppointment = new completedAppointmentModel(
                {
                id: updatedAppointment.id,
                username: appointment.username,
                choosedService: appointment.choosedService,
                choosedServiceType: appointment.choosedServiceType,
                choosedServicePrice: appointment.choosedServicePrice,
                service: appointment.service,
                homeServicePrice: appointment.homeServicePrice,
                urgentBook: appointment.urgentBook,
                urgentBookPrice: appointment.urgentBookPrice,
                selectedDate: appointment.selectedDate,
                choosedTime: appointment.choosedTime,
                totalPrice: appointment.totalPrice,
                feedback: appointment.feedback,}
            );
         
            await completedAppointment.save();

            // Optionally, delete the appointment from the main collection
            await appointmentModel.findByIdAndDelete(updatedAppointment.id);

            return completedAppointment;
            
        } catch (error) {
            console.error('Error completing appointment:', error);
            throw error;
        }
    }
    // Get an appointment by ID
    static async findById(id) {
        try {
            return await appointmentModel.findById(id);
        } catch (error) {
            console.error('Error finding appointment by ID:', error);
            throw error;
        }
    }

    // Get all completed appointments
    static async getAllCompletedAppointments() {
        try {
            // Retrieve all completed appointments from the database
            const completedAppointments = await completedAppointmentModel.find();
            return completedAppointments;
        } catch (error) {
            console.error('Error fetching all completed appointments:', error);
            throw error;
        }
    }

    // Delete an appointment by ID
    static async deleteAppointmentById(id) {
        try {
            console.log(`Attempting to delete appointment with ID: ${id}`);
            const deletedAppointment = await appointmentModel.findByIdAndDelete(id);
            // If deletedAppointment is null, it means the appointment was not found
            if (!deletedAppointment) {
                console.error(`Appointment not found with ID: ${id}`);
                throw new Error('Appointment not found');
            }
        
            // Return the deleted appointment data
            console.log(`Appointment deleted successfully with ID: ${id}`);
            return deletedAppointment;
                // res.status(200).json({
                //     status: true,
                //     message: 'Appointment deleted successfully',
                // });
        } catch (error) {
            console.error('Error deleting appointment:', error);
            throw error;
        }
    }
}

module.exports = appointmentService;
