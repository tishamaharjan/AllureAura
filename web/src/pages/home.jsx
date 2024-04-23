import React, { useState, useEffect } from "react";
import { Button } from "../components/button";
import axios from 'axios';
import { toast } from "react-toastify";


const Home = () => {
    const [appointments, setAppointments] = useState([]);
    const [error, setError] = useState(null);

    useEffect(() => {
        const getAppointmentDetails = async () => {
            try {
                const response = await axios.get('http://localhost:3005/appointment');
                setAppointments(response.data);// Storing appointments data in a state
            } catch (error) {
                setError(`Failed to get appointment details: ${error.message}`);
                toast.error('Error fetching appointments:', error);
            }
        };

        getAppointmentDetails();
    }, []);

    const completeAppointment = async (appointmentId) => {
        try {
            toast.error(`http://localhost:3005/appointment/complete`);
            await axios.post(`http://localhost:3005/appointment/complete`, { id: appointmentId });


            // Updating the appointments details by filtering the completed appointment
            setAppointments(appointmentDetails =>
                appointmentDetails.filter(appointment => appointment._id !== appointmentId)
            );
        } catch (error) {
            toast.error('Error marking appointment as completed:', error);
        }
    };

    const cancelAppointment = async (appointmentId) => {
        try {
            toast.error(`http://localhost:3005/appointment/${appointmentId}/complete`);
            await axios.delete(`http://localhost:3005/appointment/${appointmentId}/complete`);
            toast.success('Appointment deleted successfully!');

            
        } catch (error) {
            toast.error('Error cancelling appointment:', error);
        }
    };


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
                            

                            <Button
                                label={"Completed"}
                                color={"secondary"}
                                onClick={() => completeAppointment(appointment._id)}
                            />

                            <Button
                                label={"Cancel"}
                                color={""}
                                onClick={() => cancelAppointment(appointment._id)}
                            />
                        </div>
                    ))}

                </div>

            </div>

        </div>
    );
};


export default Home;

