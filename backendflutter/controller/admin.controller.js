const jwt = require('jsonwebtoken');

exports.login = async(req,res,next) => {
    try{
        const {username, password} = req.body;
        console.log('Username:', username);
        console.log('Password:', password);


        if (username === 'admin' && password === 'admin') {
            console.log('IF condition');
            const tokenData = { username: 'admin', role: 'admin' };   

            // Generating JWT token for the admin
            const token = jwt.sign(tokenData, "secretKey", { expiresIn: '1h' });
          
            // Set the token as a cookie
            res.cookie('cookieToken', token, { maxAge: 3600000, httpOnly: true });
            return res.status(200).json({ status: true, message: 'Admin login successful', token });
        }

        // If credentials do not match
        return res.status(401).json({ status: false, message: 'Invalid username or password.' });
        
    }
    catch(error) {
        console.error('Error:', error);
        return res.status(500).json({ status: false, message: "Internal Server Error." });
    }
}