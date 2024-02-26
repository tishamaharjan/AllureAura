const router = require('express').Router(); //importing router from express library
const userController = require("../controller/user.controller");

router.post('/registration',userController.register);
router.post('/login',userController.login);
//registration and login is an API

module.exports = router;