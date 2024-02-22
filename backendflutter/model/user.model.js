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
        const salt = await(bcrypt.genSalt(10));//initiaizing salt to encrypt password
        const hashpass = await bcrypt.hash(user.password,salt);//storing incrypted password in hasdpass

            user.password = hashpass;

    }
    catch (error){
        throw error;
    }
})

userSchema.method.comparePassword = async function(password){
    try{
        const isMatch = await bcrypt.compare(pass)
    }
    catch(error){
        throw error;
    }
}

const userModel = db.model('user',userSchema); // to create userschema(Schema) in databae

module.exports = userModel;