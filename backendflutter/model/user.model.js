const mongoose = require('mongoose');
const bcrypt = require("bcrypt");
const db = require('../config/db');

const { Schema } = mongoose; // importing schema property from mongoose

const userSchema = new Schema({
    fullname:{
        type: String,
        lowercase: true,
    },
    username:{
        type: String,
        lowercase: true,
        unique: true
    },
    email:{
        type: String,
        lowercase: true,
        unique: true
    },
    phonenumber:{
        type: String,
        lowercase: true,
        unique: true
    },
    password:{
        type: String,
    }
});

userSchema.pre('save', async function(){
    try{
        
        //Initializing salt for incrypting password and stroing in hashpass
        const salt = await(bcrypt.genSalt(10));
        const hashedpass = await bcrypt.hash(this.password,salt);

            this.password = hashedpass;

    }
    catch (error){
        throw error;
    }
})


userSchema.methods.passwordComparison = async function(userPassword){
    try{
        console.log("Stored Hashed Password:", this.password);
        console.log("Newly Entered Password:", userPassword);

        const  isMatch = await bcrypt.compare(userPassword, this.password);
        console.log("Passwords Match:", isMatch);
        
        return isMatch; 
       

    }
    catch(error){
        console.error('Error comparing passwords:', error);
        throw error;
    }
    
}

const userModel = db.model('user',userSchema); // to create userschema(Schema) in databae

module.exports = userModel;