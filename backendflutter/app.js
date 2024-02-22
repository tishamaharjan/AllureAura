const express = require ('express');
const body_parser = require("body-parser");
const userRouter = require("./routers/user.router");


const app = express(); //importing express module

app.use(body_parser.json());

app.use('/',userRouter);

module.exports = app;