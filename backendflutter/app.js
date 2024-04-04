const express = require ('express');
const body_parser = require("body-parser");
const userRouter = require("./routers/user.router");
const session = require('express-session');
const cookieParser = require('cookie-parser');


const app = express(); //importing express module

app.use(body_parser.json());

app.use(cookieParser());

app.use(session({
    secret: 'fyp',
    resave: false,
    saveUninitialized: true
}));

app.use('/',userRouter);

module.exports = app;