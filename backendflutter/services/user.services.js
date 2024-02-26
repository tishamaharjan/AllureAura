const userModel = require('../model/user.model')
const jwt = require('jsonwebtoken');

class userService{
    static async registerUser(fullname, username, email, phonenumber, password){
        try{
            const createUser = new userModel({fullname, username, email, phonenumber, password});
            return await createUser.save();
        }

        catch(err){
            throw err;
        }
    }

    static async loginUser(username, password){
        try{
            const user = await userModel.findOne({username});
           
            return user;  

            const isMatch = await bcrypt.compare(password, user.password);
            if (!isMatch) {
                return null; 
            }
        }

        catch(err){
            throw err;
        }
    }

    static async generateToken(tokenData, secretKey, jwt_time){
        return jwt.sign(tokenData,secretKey,{expiresIn:jwt_time});

    }
}
module.exports = userService;