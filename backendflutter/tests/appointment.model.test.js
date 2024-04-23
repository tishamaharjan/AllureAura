const mongoose = require('mongoose');
const { appointmentModel, completedAppointmentModel } = require('../model/appointment.model'); 

describe('Appointment Model', () => {
    let mongooseConnection;

    beforeAll(async () => {
        mongooseConnection = await mongoose.createConnection('mongodb://127.0.0.1:27017/testdb', {});
    });

    afterAll(async () => {
        await mongooseConnection.close();
        
    });

    it('Should create an appointment', async () => {
        const appointmentDetails = {
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

        const appointment = await appointmentModel.create(appointmentDetails);

        expect(appointment).toMatchObject(appointmentDetails);
    });
});

describe('Completed Appointment Model', () => {
    let mongooseConnection;

    beforeAll(async () => {
        mongooseConnection = await mongoose.createConnection('mongodb://127.0.0.1:27017/testdb', {});
    });

    afterAll(async () => {
        await mongooseConnection.close();
        await mongoose.disconnect();
    });

    it('Should add completed appointment', async () => {
        const completedAppointmentDetails = {
            username: 'testUser',
            chosenService: 'Makeup',
            chosenServiceType: 'Basic',
            chosenServicePrice: 2000,
            service: 'In parlour',
            homeServicePrice: 0,
            urgentBook: 'Yes',
            urgentBookPrice: 500,
            selectedDate: '2024-04-10',
            chosenService: '11:00 AM',
            totalPrice: 2500,
            feedback: 'Good experience',
        };

        const completedAppointment = await completedAppointmentModel.create(completedAppointmentDetails);

        expect(completedAppointment).toMatchObject(completedAppointmentDetails);
    });
});
