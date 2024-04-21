const adminrouter = require('express').Router(); //Importing router object from express library
const cors = require('cors');
const adminController = require("../controller/admin.controller");

// Configuring and applying CORS to router
const corsOptions = {
    origin: 'http://localhost:3000', // Allowing requests from the origin of front-end
    methods: ['POST'], // Specifying allowed methods 
    credentials: true, // Allowing credentials like cookies
};

// Applying CORS middleware to router
adminrouter.use(cors(corsOptions));

// API of admin login
adminrouter.post('/loginadmin',adminController.login);

module.exports = adminrouter;