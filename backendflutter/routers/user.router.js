const router = require('express').Router(); //importing router object from express library
const userController = require("../controller/user.controller");

// API of registration and login
router.post('/registration',userController.register);
router.post('/login',userController.login);

router.get('/users/:username',userController.getUserDetails);
router.put('/users/:username', userController.updateUser)

module.exports = router;