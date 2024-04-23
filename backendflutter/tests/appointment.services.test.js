const { appointmentModel } = require('../model/appointment.model');


jest.mock('../model/appointment.model', () => ({
    appointmentModel: {
        create: jest.fn().mockImplementation(appointmentData => ({
            ...appointmentData,
            save: jest.fn().mockResolvedValue({ _id: 'testId' }), // Mocking the save method
        })),
        find: jest.fn(),
    },
}));

const appointmentService = require('../services/appointment.services');


describe('Appointment Service', () => {
    afterEach(() => {
        jest.clearAllMocks();
    });

    // Testing createAppointment method
    describe('CreateAppointment', () => {
        it('Should create a new appointment', async () => {

            const appointmentDetails = {
                username: 'testUser',
                chosenService: 'Test Service',
                chosenServiceType: 'Makeup',
                chosenServicePrice: 500,
                service: 'In parlour',
                homeServicePrice: 0,
                urgentBook: 'Yes',
                urgentBookPrice: 500,
                selectedDate: '2024-04-17 00:00:00.000',
                chosenTime: '12:30 PM',
                totalPrice: 1000
            };

            const createdAppointment = await appointmentService.createAppointment(
                appointmentDetails.username,
                appointmentDetails.chosenService,
                appointmentDetails.chosenServiceType,
                appointmentDetails.chosenServicePrice,
                appointmentDetails.service,
                appointmentDetails.homeServicePrice,
                appointmentDetails.urgentBook,
                appointmentDetails.urgentBookPrice,
                appointmentDetails.selectedDate,
                appointmentDetails.chosenTime,
                appointmentDetails.totalPrice,
            );

            expect(appointmentModel.create).toHaveBeenCalledWith(expect.objectContaining(appointmentDetails));
            expect(createdAppointment).toEqual({ _id: 'testId' });
        });
    });

    // Testing getAllAppointments method
    describe('getAllAppointments', () => {
        it('should get all appointments', async () => {
            const mockAppointments = [{}, {}]; // Mocked array of appointments
            appointmentModel.find.mockResolvedValueOnce(mockAppointments);


            const appointments = await appointmentService.getAllAppointments();

            expect(appointmentModel.find).toHaveBeenCalledTimes(1); 
            //expect(mockFind).toHaveBeenCalledTimes(1);
            expect(appointments).toEqual(mockAppointments);
        });
    });
});
