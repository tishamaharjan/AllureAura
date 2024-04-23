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
        const getAppointmentDetails = async () => {
            try {
                const response = await axios.get('http://localhost:3005/addstaff');
                setDisplayData(response.data);// Store appointments data in state
            } catch (error) {
                setError(`Failed to get appointment details: ${error.message}`);
                console.error('Error fetching appointments:', error);
            }
        };

        getAppointmentDetails();
    }, []);


    const addProfile = async () => {
	// 	if (staffData.trim() === "") {
	// 	setShowstaffDataError(true);
	// 	toast.error('Please enter username.');
	//   } else {
	// 	setShowstaffDataError(false);
	//   }

        try {
            // Send a POST request to the back-end API
            await axios.post('http://localhost:3005/addstaff', staffData);

            // If the response is successful, show a success toast
            toast.success('New staff added successfully!');

            // Clear form inputs (optional)
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
        
    }
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
						onTextChange={(text) => setStaffData({...staffData, address: text})}	
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

			<div>
			<div style={{ textAlign: "center" }}>
                <i><h1>Staff Profile</h1></i>
            </div>

            {error && <div>{error}</div>}
            <div className="styles.buttomContainer">
                <div style={{ height: "100%", padding: "10px" }}>


                    <ul>
                        {DisplayData.map((staff) => (
                            <div key={staff.id} style={{ marginBottom: "10px", padding: "10px", border: "1px solid black", borderRadius: "5px" }}>
                                <p><strong>Staff Id:</strong> {staff.staffId}</p>
                                <p><strong>Staff Name:</strong> {staff.staffname}</p>
                                <p><strong>Email:</strong> {staff.email}</p>
                                <p><strong>Address:</strong> {staff.address}</p>
                                <p><strong>Phone Number:</strong> {staff.phoneNumber}</p>
                            </div>
                        ))}
                    </ul>
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
		flex: 1,
		height: "100vh",
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
		alignItems: "center",
		justifyContent: "center",
		height: "100%",
	},

}
export default StaffProfile;