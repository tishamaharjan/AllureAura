const app = require ('./app'); 
const db = require('./config/db')
const userModel = require('./model/user.model')

//Creating server
const port = 3005;

app.get('/',(req,res) => {
    res.send("Hello world!!!!!")
})

app.listen(port,() => {
    console.log(`Server Listening on Port http://localhost:${port}`);
})