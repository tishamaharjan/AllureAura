import React, { useState, useEffect } from "react";
import axios from 'axios';
import { toast } from "react-toastify";

const History = () => {
    const [appointments, setAppointments] = useState([]);
    const [error, setError] = useState(null);

    useEffect(() => {
        const getAppointmentDetails = async () => {
            try {
                const response = await axios.get('http://localhost:3005/appointment/complete');
                setAppointments(response.data);// Storing appointments data in a state
            } catch (error) {
                setError(`Failed to get appointment details: ${error.message}`);
                toast.error('Error fetching appointments:', error);
            }
        };

        getAppointmentDetails();
    }, []);

    return (
        <div>
            <div style={{ textAlign: "center" }}>
                <i><h1>Appointments</h1></i>
            </div>

            {error && <div>{error}</div>}
            <div className="maindiv">
                <div style={{ height: "100%", padding: "10px", minWidth: "50%" }}>
                    {appointments.map((appointment, index) => (
                        <div key={index} style={{ marginBottom: "10px",textAlign: "center", padding: "10px", border: "1px solid black", borderRadius: "5px", backgroundColor: "#F1EAFF" }}>
                            <p><strong>Username:</strong> {appointment.username}</p>
                            <p><strong>Service:</strong> {appointment.chosenService}</p>
                            <p><strong>Service Type:</strong> {appointment.chosenServiceType}</p>
                            <p><strong>Service Price:</strong> {appointment.chosenServicePrice}</p>
                            <p><strong>Home Service:</strong> {appointment.homeServicePrice}</p>
                            <p><strong>Urgent Booking:</strong> {appointment.urgentBookPrice}</p>
                            <p><strong>Selected Date:</strong> {new Date(appointment.selectedDate).toLocaleDateString()}</p>
                            <p><strong>Chosen Time:</strong> {appointment.chosenTime}</p>
                            <p><strong>Total Price:</strong> {appointment.totalPrice}</p>
                            <p><strong>Feedback:</strong> {appointment.feedback}</p>
                        </div>
                    ))}

                </div>

            </div>

        </div>
    );
};

export default History;