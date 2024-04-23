const request = require('supertest');
const app = require('../app'); // Adjust the path based on the actual location of your app.js file
const appointmentService = require('../services/appointment.services');

jest.mock('../services/appointment.services');

describe('Appointment Controller', () => {
    afterEach(() => {
        jest.clearAllMocks();
    });

    // Test case for creating an appointment
    it('POST /appointment should create a new appointment', async () => {
        const appointmentData = {
            // Provide necessary appointment data here
        };

        appointmentService.createAppointment.mockResolvedValueOnce(/* Mocked response */);

        const response = await request(app)
            .post('/appointment')
            .send(appointmentData);

        expect(response.statusCode).toBe(201);
        expect(response.body.status).toBe(true);
        // Add more assertions as needed
    });

    // Test case for getAll
    it('GET /appointments should get all appointments', async () => {
        const mockAppointments = [{}, {}]; // Mocked array of appointments

        appointmentService.getAllAppointments.mockResolvedValueOnce(mockAppointments);

        const response = await request(app)
            .get('/appointment');

        expect(response.statusCode).toBe(200);
        expect(response.body).toEqual(mockAppointments);
    });

    // Test case for remove
    it('DELETE /appointment/:id should delete an appointment', async () => {
        const mockDeletedAppointment = { id: 'testId' };

        appointmentService.deleteAppointmentById.mockResolvedValueOnce(mockDeletedAppointment);

        const response = await request(app)
            .delete(`/appointment/${mockDeletedAppointment.id}/complete`);

        expect(response.statusCode).toBe(200);
        expect(response.body.message).toBe('Appointment deleted successfully');
    });
});
