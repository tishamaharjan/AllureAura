const staffrouter = require('express').Router(); 
const staffController = require('../controller/staff.controller');

const cors = require('cors');


const corsOptions = {
    origin: 'http://localhost:3000', // Allow requests from the front-end origin
    methods: ['POST','GET','DELETE'], // Specify allowed methods 
    credentials: true, // Allow credentials (e.g., cookies)
};
staffrouter.use(cors(corsOptions));

staffrouter.post('/addstaff',staffController.staffadd);
staffrouter.get('/addstaff',staffController.getStaffDetails);
staffrouter.delete('/addstaff/:id',staffController.deleteStaff);

module.exports = staffrouter;
