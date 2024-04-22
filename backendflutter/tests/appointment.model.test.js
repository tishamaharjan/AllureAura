const mongoose = require('mongoose');
const { appointmentModel, completedAppointmentModel } = require('../model/appointment.model'); 

describe('Appointment Model', () => {
    beforeAll(async () => {
        await mongoose.connect('mongodb://127.0.0.1:27017/testdb', {
            useNewUrlParser: true,
            useUnifiedTopology: true,
        });
    });

    afterAll(async () => {
        await mongoose.connection.close();
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
            chosenService: '11:00 AM',
            totalPrice: 2500,
        };

        const appointment = await appointmentModel.create(appointmentDetails);

        expect(appointment).toMatchObject(appointmentDetails);
    });
});

describe('Completed Appointment Model', () => {
    beforeAll(async () => {
        await mongoose.connect('mongodb://127.0.0.1:27017/testdb', {
            useNewUrlParser: true,
            useUnifiedTopology: true,
        });
    });

    afterAll(async () => {
        await mongoose.connection.close();
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
