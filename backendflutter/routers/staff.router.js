const staffrouter = require('express').Router(); 
const staffController = require('../controller/staff.controller');

const cors = require('cors');

// Configuring and applying CORS to staffrouter
const corsOptions = {
    origin: 'http://localhost:3000', 
    methods: ['POST','GET','DELETE'], 
    credentials: true, 
};
staffrouter.use(cors(corsOptions));

staffrouter.post('/addstaff',staffController.staffadd);
staffrouter.get('/addstaff',staffController.getStaffDetails);
staffrouter.delete('/addstaff/:id',staffController.deleteStaff);

module.exports = staffrouter;
