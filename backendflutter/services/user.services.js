const userModel = require('../model/user.model')

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
            const LoginUser = new userModel({username, password});
            return await LoginUser.save();
        }

        catch(err){
            throw err;
        }
    }
}

module.exports = userService;