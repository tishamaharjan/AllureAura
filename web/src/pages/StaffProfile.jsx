import '../App.css';
import React, { useState, useEffect } from "react";
import axios from 'axios';

import { TextInput } from "../components/textInput";
import { Button } from "../components/button";

import { toast, ToastContainer } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';

const StaffProfile = () => {
	// State to manage form inputs
	const [staffData, setStaffData] = useState({
		staffId: '',
		staffname: '',
		email: '',
		address: '',
		phoneNumber: ''
	});
	const [DisplayData, setDisplayData] = useState([]);
	const [error, setError] = useState(null);
	//const [showstaffDataError, setShowstaffDataError] = useState(false);

	useEffect(() => {
		const getStaffDetails = async () => {
			try {
				const response = await axios.get('http://localhost:3005/addstaff');
				setDisplayData(response.data.staff);// Store appointments data in state
			} catch (error) {
				setError(`Failed to get appointment details: ${error.message}`);
				console.error('Error fetching appointments:', error);
			}
		};

		getStaffDetails();
	}, []);


	const addProfile = async () => {
		// 	if (staffData.trim() === "") {
		// 	setShowstaffDataError(true);
		// 	toast.error('Please enter username.');
		//   } else {
		// 	setShowstaffDataError(false);
		//   }

		try {
			// Sending a POST request to the back-end API
			await axios.post('http://localhost:3005/addstaff', staffData);
			toast.success('New staff added successfully!');

			// Clear form inputs
			setStaffData({
				staffId: '',
				staffname: '',
				email: '',
				address: '',
				phoneNumber: ''
			});


		} catch (error) {
			// If there is an error, show an error toast
			toast.error('Failed to add staff: ' + error.message);
		}
	};

	const deleteStaff = async (staffIdDelete) => {
        try {
            await axios.delete(`http://localhost:3005/addstaff/${staffIdDelete}`);
			toast.success('Staff deleted successfully!');

			
			
        } catch (error) {
            toast.error('Error deleting staff:', error.code);
        }
    };

	return (
		<div style={styles.container}>
			<div style={styles.topContainer}>
				<form style={styles.formContainer} action="submit">
					<h1 style={{ textAlign: "center", marginBottom: 20 }}>Add Staff Detail</h1>
					<TextInput
						type="text"
						placeholder="StaffID"
						value={staffData.staffId}
						onTextChange={(text) => setStaffData({ ...staffData, staffId: text })}
					//showError={showstaffDataError}
					/>

					<TextInput
						type="text"
						placeholder="Staff Name"
						value={staffData.staffname}
						onTextChange={(text) => setStaffData({ ...staffData, staffname: text })}
					//showError={showstaffDataError}
					/>
					<TextInput
						type="text"
						placeholder="Email"
						value={staffData.email}
						onTextChange={(text) => setStaffData({ ...staffData, email: text })}
					//showError={showstaffDataError}
					/>

					<TextInput
						type="text"
						placeholder="Address"
						value={staffData.address}
						onTextChange={(text) => setStaffData({ ...staffData, address: text })}
					//showError={showstaffDataError}
					/>

					<TextInput
						type="text"
						placeholder="Phone number"
						value={staffData.phoneNumber}
						onTextChange={(text) => setStaffData({ ...staffData, phoneNumber: text })}
					//showError={showstaffDataError}
					/>

					<Button
						label={"Add staff"}
						color={"secondary"}
						onClick={addProfile}
					/>
				</form>
			</div>
			<div style={{width: "100%"}}>
			<hr style={{ borderTop: '5px solid black' }}/>
			</div>
			<div style={{width: "100%"}}>
				<div style={{ textAlign: "center", marginTop: 50}}>
					<i><h1>Staff Profile</h1></i>
				</div>

				<div style ={styles.buttomContainer}>
					<div style={{ height: "100%", padding: "10px" }}>
						{DisplayData.map((staff,index) => (
							<div key={index} style={{  marginBottom: "10px",   padding: "10px", border: "1px solid black", borderRadius: "5px", backgroundColor: "#F1EAFF" }}>
								<p><strong>Staff Id:</strong> {staff.staffId}</p>
								<p><strong>Staff Name:</strong> {staff.staffname}</p>
								<p><strong>Email:</strong> {staff.email}</p>
								<p><strong>Address:</strong> {staff.address}</p>
								<p><strong>Phone Number:</strong> {staff.phoneNumber}</p>

								<Button
									label={"Delete"}
									color={""}
									onClick={() => deleteStaff(staff._id)}
								/>
							</div>
						))}

					</div>

				</div>
			</div>

			<ToastContainer
				position="top-right" // Set the position of the toasts (can be changed)
				autoClose={5000} // Time in milliseconds for the toast to automatically close
				hideProgressBar={false} // Display a progress bar on the toast
				newestOnTop={true} // Display the newest toast at the top
				closeOnClick // Close the toast on click
				rtl={false} // Support for right-to-left text
				pauseOnFocusLoss // Pause the toast on focus loss
				draggable // Allow the toast to be draggable
				pauseOnHover // Pause the toast on hover
			/>
		</div>


	);
};

const styles = {
	container: {
		//backgroundColor: "blue",
		display: "flex",
		flexDirection: "column",
		minHeight: "100vh",
		// width: "100%",
		alignItems: "center",
		justifyContent: "center",

	},

	topContainer: {
		//backgroundColor: "red",
		display: "flex",
		flexDirection: "column",
		alignItems: "center",
		justifyContent: "center",
		height: "100%",
		width: "100%",
		marginBottom: "20px",
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

	buttomContainer: {
		//backgroundColor: "red",
		display: "flex",
		flexDirection: "column",
		height: "100%",
	},

}
export default StaffProfile;