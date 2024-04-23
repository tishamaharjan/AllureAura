// const mongoose = require('mongoose');
// const appointmentService = require('../services/appointment.services');
// const { appointmentModel, completedAppointmentModel } = require('../model/appointment.model');

// // Mocking the database models
// jest.mock('../model/appointment.model', () => ({
//     appointmentModel: jest.fn().mockImplementation(() => ({
//         save: jest.fn(),
//         find: jest.fn(),
//         findById: jest.fn(),
//         findByIdAndDelete: jest.fn()
//     })),
//     completedAppointmentModel: jest.fn().mockImplementation(() => ({
//         save: jest.fn(),
//         find: jest.fn()
//     }))
// }));

// describe('Appointment Service', () => {

//     // Testing for createAppointment method
//     it('Should create an appointment', async () => {
//         const appointmentDetails = {
//             username: 'testUser',
//             chosenService: 'Makeup',
//             chosenServiceType: 'Basic',
//             chosenServicePrice: 2000,
//             service: 'In parlour',
//             homeServicePrice: 0,
//             urgentBook: 'Yes',
//             urgentBookPrice: 500,
//             selectedDate: '2024-04-10',
//             chosenTime: '11:00 AM',
//             totalPrice: 2500,
//         };

//         // Mocking the return value of appointmentModel.create
//     jest.spyOn(appointmentModel, 'create').mockResolvedValueOnce(appointmentDetails);

//     const appointment = await appointmentService.createAppointment(appointmentDetails);

//     // Expectation: appointmentModel.create should be called with the provided details
//     expect(appointmentModel.save).toHaveBeenCalledWith(appointmentDetails);

//     // Expectation: The returned appointment should match the expected appointment details
//     expect(appointment).toEqual(appointmentDetails);
//     });
// });


// describe('Appointment Service Complete', () => {

//     beforeEach(() => {
//         // Clear mocks before each test case for better isolation
//         jest.clearAllMocks();
//       });
//     // Testing for createAppointment method
//     it('Should complete an appointment', async () => {
//         const appointmentId = '123';
//       const updatedAppointment = { id: appointmentId, feedback: 'Good' };

//         // Mock findById to return a mock appointment object
//       appointmentModel.findById.mockResolvedValueOnce(updatedAppointment);

//       await appointmentService.completeAppointment(updatedAppointment);

//       // Assertions for expected behavior (e.g., appointment saved, deleted, etc.)
//       expect(appointmentModel.findById).toHaveBeenCalledWith(appointmentId);
//       expect(appointmentModel.save).toHaveBeenCalled();
//       expect(appointmentModel.findByIdAndDelete).toHaveBeenCalledWith(appointmentId);

//         // Expectation: The returned appointment should match the completed appointment details
//         expect(completedAppointment).toEqual(completeAppointmentDetails);
//     });

//     it('Should throw error on unsuccessful findById', async () => {
//         const appointmentId = '123';
//         const updatedAppointment = { id: appointmentId, feedback: 'Good' };
  
//         // Mock findById to throw an error
//         appointmentModel.findById.mockRejectedValueOnce(new Error('Appointment not found'));
  
//         await expect(appointmentService.completeAppointment(updatedAppointment)).rejects.toThrow('Appointment not found');
//       });
// });
