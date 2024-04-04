const session = require('express-session');

exports.sessionMiddleware = session({
    secret: 'fyp',
    resave:false,
    saveUninitialized: true
});

//For setting session data
exports.setSessionData = (req, key, value) => {
    req.session[key] = value;
};

//For getting session data
exports.getSessionData = (req, key) => {
    return req.session[key];
};