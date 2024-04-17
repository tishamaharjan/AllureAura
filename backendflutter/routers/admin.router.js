const adminrouter = require('express').Router(); //Importing router object from express library
const cors = require('cors');
const adminController = require("../controller/admin.controller");

// Configure and apply CORS to this router
const corsOptions = {
    origin: 'http://localhost:3000', // Allow requests from the front-end origin
    methods: ['POST'], // Specify allowed methods (in this case, POST for login)
    credentials: true, // Allow credentials (e.g., cookies)
};

// Apply CORS middleware to this router
adminrouter.use(cors(corsOptions));

adminrouter.post('/loginadmin',adminController.login);
// API of registration and login

module.exports = adminrouter;