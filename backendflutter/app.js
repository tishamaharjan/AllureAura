const express = require ('express');
const body_parser = require('body-parser');

const session = require('express-session');
const cookieParser = require('cookie-parser');

const userRouter = require('./routers/user.router');
const appRouter = require('./routers/appointment.router');
const adminRouter = require('./routers/admin.router');
const staffRouter = require('./routers/staff.router');

const app = express(); //importing express module

app.use(body_parser.json());

app.use(cookieParser());

app.use(session({
    secret: 'fyp',
    resave: false,
    saveUninitialized: true
}));

app.use('/',userRouter);
app.use('/',appRouter);
app.use('/',adminRouter);
app.use('/',staffRouter);

module.exports = app;