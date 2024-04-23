const appointmentController = require('../controller/appointment.controller');

// Mock the appointmentService functions
jest.mock('../services/appointment.services', () => ({
    createAppointment: jest.fn(),
    getAllAppointments: jest.fn(),
    completeAppointment: jest.fn(),
    getAllCompletedAppointments: jest.fn(),
    deleteAppointmentById: jest.fn(),
}));

describe('Appointment Controller', () => {
    let req, res;

    beforeEach(() => {
        req = {
            body: {
                username: 'testUser',
                chosenService: 'Makeup',
                chosenServiceType: 'Basic',
                chosenServicePrice: 2000,
                service: 'In parlour',
                homeServicePrice: 0,
                urgentBook: 'Yes',
                urgentBookPrice: 500,
                selectedDate: '2024-04-10',
                chosenTime: '11:00 AM',
                totalPrice: 2500,
            },
        };
        res = {
            status: jest.fn().mockReturnThis(),
            json: jest.fn(),
        };
    });

    afterEach(() => {
        jest.resetAllMocks();
    });

    describe('create', () => {
        it('should create a new appointment', async () => {
            const mockAppointment = {
                _id: '123',
                username: 'testUser',
                chosenService: 'Makeup',
                chosenServiceType: 'Basic',
                chosenServicePrice: 2000,
                service: 'In parlour',
                homeServicePrice: 0,
                urgentBook: 'Yes',
                urgentBookPrice: 500,
                selectedDate: '2024-04-10',
                chosenTime: '11:00 AM',
                totalPrice: 2500,
            };
            appointmentService.createAppointment.mockResolvedValue(mockAppointment);

            await appointmentController.create(req, res);

            expect(appointmentService.createAppointment).toHaveBeenCalled();
            expect(res.status).toHaveBeenCalledWith(201);
            expect(res.json).toHaveBeenCalledWith({
                status: true,
                success: 'Appointment created successfully',
            });
        });
    });

    describe('getAll', () => {
        it('should fetch all appointments', async () => {
            const mockAppointments = [{
                _id: '123',
                username: 'testUser',
                chosenService: 'Makeup',
                chosenServiceType: 'Basic',
                chosenServicePrice: 2000,
                service: 'In parlour',
                homeServicePrice: 0,
                urgentBook: 'Yes',
                urgentBookPrice: 500,
                selectedDate: '2024-04-10',
                chosenTime: '11:00 AM',
                totalPrice: 2500,
            }];
            appointmentService.getAllAppointments.mockResolvedValue(mockAppointments);

            await appointmentController.getAll(req, res);

            expect(appointmentService.getAllAppointments).toHaveBeenCalled();
            expect(res.json).toHaveBeenCalledWith(mockAppointments);
        });

        // Add more test cases for error scenarios
    });

    describe('completeAppointment', () => {
        it('should complete an appointment', async () => {
            const mockCompletedAppointment = {
                _id: '123',
                username: 'testUser',
                chosenService: 'Makeup',
                chosenServiceType: 'Basic',
                chosenServicePrice: 2000,
                service: 'In parlour',
                homeServicePrice: 0,
                urgentBook: 'Yes',
                urgentBookPrice: 500,
                selectedDate: '2024-04-10',
                chosenTime: '11:00 AM',
                totalPrice: 2500,
                feedback: "Great",
            };
            appointmentService.completeAppointment.mockResolvedValue(mockCompletedAppointment);

            await appointmentController.completeAppointment(req, res);

            expect(appointmentService.completeAppointment).toHaveBeenCalledWith(req.body);
            expect(res.status).toHaveBeenCalledWith(200);
            expect(res.json).toHaveBeenCalledWith({
                message: 'Appointment completed and moved to completed appointments collection',
                completedAppointment: mockCompletedAppointment,
            });
        });

        // Add more test cases for error scenarios
    });

    describe('getAllCompleted', () => {
        it('should fetch all completed appointments', async () => {
            const mockCompletedAppointments = [{
                _id: '123',
                username: 'testUser',
                chosenService: 'Makeup',
                chosenServiceType: 'Basic',
                chosenServicePrice: 2000,
                service: 'In parlour',
                homeServicePrice: 0,
                urgentBook: 'Yes',
                urgentBookPrice: 500,
                selectedDate: '2024-04-10',
                chosenTime: '11:00 AM',
                totalPrice: 2500,
                feedback: "Great",
            }];
            appointmentService.getAllCompletedAppointments.mockResolvedValue(mockCompletedAppointments);

            await appointmentController.getAllCompleted(req, res);

            expect(appointmentService.getAllCompletedAppointments).toHaveBeenCalled();
            expect(res.status).toHaveBeenCalledWith(200);
            expect(res.json).toHaveBeenCalledWith(mockCompletedAppointments);
        });

        // Add more test cases for error scenarios
    });

    describe('remove', () => {
        it('should delete an appointment', async () => {
            const mockDeletedAppointment = {
                _id: '123',
                username: 'testUser',
                chosenService: 'Makeup',
                chosenServiceType: 'Basic',
                chosenServicePrice: 2000,
                service: 'In parlour',
                homeServicePrice: 0,
                urgentBook: 'Yes',
                urgentBookPrice: 500,
                selectedDate: '2024-04-10',
                chosenTime: '11:00 AM',
                totalPrice: 2500,
            };
            appointmentService.deleteAppointmentById.mockResolvedValue(mockDeletedAppointment);

            req.params = { id: 'appointmentId' };

            await appointmentController.remove(req, res);

            expect(appointmentService.deleteAppointmentById).toHaveBeenCalledWith('appointmentId');
            expect(res.status).toHaveBeenCalledWith(200);
            expect(res.json).toHaveBeenCalledWith({
                message: 'Appointment deleted successfully',
            });
        });

        // Add more test cases for error scenarios
    });
});