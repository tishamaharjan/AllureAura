const router = require('express').Router(); //importing router from express library
const userController = require("../controller/user.controller");

router.post('/registration',userController.register);
router.post('/login',userController.login);
// API of registration and login

module.exports = router;