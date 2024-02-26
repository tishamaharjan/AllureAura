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
        var user = this;
        //Initializing salt for incrypting password and stroing in hashpass
        const salt = await(bcrypt.genSalt(10));
        const hashpass = await bcrypt.hash(user.password,salt);

            user.password = hashpass;

    }
    catch (error){
        throw error;
    }
})

userSchema.methods.passwordComparison = async function(userPassword){
    try{
        const isMatch = await bcrypt.compare(user.password, this.password);
        return isMatch;
    }
    catch(error){
        throw error;
    }
}

const userModel = db.model('user',userSchema); // to create userschema(Schema) in databae

module.exports = userModel;