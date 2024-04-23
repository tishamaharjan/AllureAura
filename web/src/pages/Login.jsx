import '../App.css';
import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import { TextInput } from "../components/textInput";
import { Button } from "../components/button";
import axios from 'axios';

import { toast, ToastContainer } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';

const Login = ({ setIsLoggedIn }) => {
	const navigate = useNavigate();
	const [username, setUsername] = useState("");
	const [password, setPassword] = useState("");

	const [showUsernameError, setShowUsernameError] = useState(false);
  	const [showPasswordError, setShowPasswordError] = useState(false);

	const onLogin = async () => {
    if (username.trim() === "") {
      setShowUsernameError(true);
	  toast.error('Please enter username.');
    } else {
      setShowUsernameError(false);
    }

    if (password.trim() === "") {
      setShowPasswordError(true);
	  toast.error('Please enter password.');
    } else {
      setShowPasswordError(false);
    }
    
    if (username.trim() !== "" && password.trim() !== "") {
		try { 
            const response = await axios.post('http://localhost:3005/loginadmin', {
                username,
                password,		
            });
			console.log({ username, password });

            const { status, message } = response.data;

            if (status) {
                setIsLoggedIn(true);
                navigate('/home');//Navigating to home page
            } else {
                toast.error(`Login failed: ${message}`);
            }
        } catch (error) {
			if (error.response && error.response.status === 403) {
				console.error('CORS error: The frontend and backend origins do not match.');
			  } else {
				toast.error('Please enter correct username and password.');
			  }
			  console.error('Error during login:', error.response ? error.response.data : error);
			}

        }
	}

	return (
		<div style={styles.container}>
			<div style={styles.leftContainer}>
				<form style={styles.formContainer} action="submit">
					<h1 style={{ textAlign: "center", marginBottom: 20 }}>Login</h1>
					<TextInput
						type="text"
						placeholder="Username"
						value={username}
						onTextChange={(text) => setUsername(text)}
						showError={showUsernameError}
					/>

					<TextInput
						type="password"
						placeholder="Password"
						value={password}
						onTextChange={(text) => setPassword(text)}
						showError={showPasswordError}
					/>

					<Button
						label={"Log In"}
						color={"secondary"}
						onClick={onLogin}
					/>
				</form>
			</div>
			<ToastContainer
                position="top-right" // For setting the position of the toasts 
                autoClose={5000} // Setting time in milliseconds for the toast for closing automatically
                hideProgressBar={false} // For displaying a timeline bar on the toast
                newestOnTop={true} // For displaying the newest toast at the top
                closeOnClick // For closing the toast on click
                rtl={false} // Supporting for right-to-left sliding
                pauseOnFocusLoss // For pausing the toast on focus loss
                draggable // For allowing the toast to be draggable
                pauseOnHover // For pausing the toast on hovering
            />
		</div>
	);
};

const styles = {
	container: {
		display: "flex",
		flex: 1,
		height: "100vh",
		alignItems: "center",
		justifyContent: "center",
		backgroundColor: "white"
	},

	leftContainer: {
		display: "flex",
		flex: 1,
		flexDirection: "column",
		alignItems: "center",
		justifyContent: "center",
		height: "100%",
	},

	formContainer: {
		display: "flex",
		flexDirection: "column",
		backgroundColor: "#ffffff",
		minWidth: "50%",
		padding: 30,
		borderRadius: 10,
		boxShadow:
			"0 4px 8px 0 rgba(0, 0, 0, 1), 0 6px 10px 0 rgba(0, 0, 0, 0.2)",
	},

	formBottom: {
		marginTop: 20,
		textAlign: "center",
	},
}
export default Login;