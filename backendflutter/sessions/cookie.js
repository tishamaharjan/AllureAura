const cookieParser = require ('cookie-parser');
const { options } = require('../app');

exports.parseCookie = cookieParser();

//Setting cookie
exports.setCookie = (res, name, value, options) => {
    res.cookie(name, value, options);
};

exports.getCookie = (req, name) => {
    return req.cookie[name];
};