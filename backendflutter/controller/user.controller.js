const userService = require("../services/user.services");

exports.register = async(req,res,next) => {
    try{
        const {fullname, username, email, phonenumber, password} = req.body;
        const successRes = await userService.registerUser(fullname, username, email, phonenumber, password);

        res.json({status:true, success: "User Registered Successfully"});
    }

    catch(error) {
        throw error
    }
}

exports.login = async(req,res,next) => {
    try{
        const {email, password} = req.body;
        const user = await userService.checkuser(email, password);

        if (!user){
            throw new Error ("User not registered.");
        }

        res.json({status:true, success: "User Loggedin Successfully"});
    }

    catch(error) {
        throw error
    }
}