const mongoose = require('mongoose');//importing mongoose

const connection = mongoose.createConnection('mongodb://127.0.0.1:27017/AllureAura').on('open', () => {
    console.log("MongoDB connected");
}).on ('error', () => {
    console.log("MongoDB connection error");
});

module.exports = connection;
