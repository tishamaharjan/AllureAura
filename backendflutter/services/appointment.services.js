const appointmentModel = require('../model/appointment.model'); 

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
    // static async getAllAppointments() {
    //     try {
    //         // Retrieve all appointments from the database
    //         return await appointmentModel.find();
    //     } catch (err) {
    //         throw err;
    //     }
    // }

    // // Get an appointment by ID
    // static async getAppointmentById(id) {
    //     try {
    //         // Retrieve the appointment by ID
    //         return await appointmentModel.findById(id);
    //     } catch (error) {
    //         throw error;
    //     }
    // }

    // // Update an appointment by ID
    // static async updateAppointmentById(id, updatedData) {
    //     try {
    //         // Update the appointment using the ID and updated data
    //         return await appointmentModel.findByIdAndUpdate(
    //             id,
    //             updatedData,
    //             { new: true } // Return the updated appointment
    //         );
    //     } catch (error) {
    //         throw error;
    //     }
    // }

    // // Delete an appointment by ID
    // static async deleteAppointmentById(id) {
    //     try {
    //         // Delete the appointment using the ID
    //         return await appointmentModel.findByIdAndDelete(id);
    //     } catch (error) {
    //         throw error;
    //     }
    // }
}

module.exports = appointmentService;
