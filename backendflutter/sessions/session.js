const session = require('express-session');

exports.sessionMiddleware = session({
    secret: 'fyp',
    resave:false,
    saveUninitialized: true
});

//Setting session data
exports.setSessionData = (req, key, value) => {
    req.session[key] = value;
};

//Getting session data
exports.getSessionData = (req, key) => {
    return req.session[key];
};