const Cookie = require('../sessions/cookie');
// const expsession = require("express-session");
const userService = require("../services/user.services");

exports.register = async(req,res,next) => {
    try{
        const {fullname, username, email, phonenumber, password} = req.body;
        const successRes = await userService.registerUser(fullname, username, email, phonenumber, password);

        res.json({status:true, success: "User Registered Successfully"});
    }

    catch(error) {
        if (error.code === 11000 && error.keyPattern && error.keyValue) {
            // Getting the duplicate key value
            const duplicateKey = Object.keys(error.keyValue)[0];
            res.status(400).json({ status: false, message: `The ${duplicateKey} is already in use.` });
        } else {
            res.status(500).json({ status: false, message: "Internal Server Error" });
        }
    }
}

exports.login = async(req,res,next) => {
    try{
        const {username, password} = req.body;

        const user = await userService.loginUser(username);
        

        if (!user){
            return res.status(404).json({ status: false, message: "User not registered." });
            
        }
        

        const pwMatch = await user.passwordComparison(password);
        
        if (pwMatch == false){
            return res.status(401).json({ status: false, message: "Invalid password." });
            
            
        }
        else{
            let tokenData = {_id:user._id,username:user.username, email: user.email,phonenumber:user.phonenumber};

            const token = await userService.generateToken(tokenData, "secretKey", '1hr')
            if (!token) {
                console.log("Error generating token");
                return res.status(500).json({ status: false, message: "Error generating token." });
            }

            Cookie.setCookie(res, 'cookieToken', token, {maxAge: 3600000,httpOnly:true});
            console.log("Cookie value:", token);
            res.status(200).json({status:true, message: "Login successful", token:token})
               
        }
        
    }

    catch(error) {
        console.error('Error:', error);
        return res.status(500).json({ status: false, message: "Internal Server Error." });
    }
}
