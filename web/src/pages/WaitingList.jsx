import React, { useState, useEffect } from "react";
import axios from 'axios';
import { toast } from "react-toastify";

const WaitingList = () => {
    const [waitings, setWaitings] = useState([]);
    const [error, setError] = useState(null);

    useEffect(() => {
        const getWaitingDetails = async () => {
            try {
                const response = await axios.get('http://localhost:3005/waitinglist');
                setWaitings(response.data);// Storing appointments data in a state
            } catch (error) {
                setError(`Failed to get waiting list details: ${error.message}`);
                toast.error('Error fetching waiting list :', error);
            }
        };

        getWaitingDetails();
    }, []);

    return (
        <div>
            <div style={{ textAlign: "center" }}>
                <i><h1>Waiting List</h1></i>
            </div>

            {error && <div>{error}</div>}
            <div className="maindiv">
                <div style={{ height: "100%", padding: "10px", minWidth: "50%" }}>
                    {waitings.map((waiting, index) => (
                        <div key={index} style={{ marginBottom: "10px",textAlign: "center", padding: "10px", border: "1px solid black", borderRadius: "5px", backgroundColor: "#F1EAFF" }}>
                            <p><strong>Username:</strong> {waiting.username}</p>
                            <p><strong>Service:</strong> {waiting.chosenService}</p>
                            <p><strong>Service Type:</strong> {waiting.chosenServiceType}</p>
                            <p><strong>Service Price:</strong> {waiting.chosenServicePrice}</p>
                            <p><strong>Home Service:</strong> {waiting.homeServicePrice}</p>
                            <p><strong>Urgent Booking:</strong> {waiting.urgentBookPrice}</p>
                            <p><strong>Selected Date:</strong> {new Date(waiting.selectedDate).toLocaleDateString()}</p>
                            <p><strong>Chosen Time:</strong> {waiting.chosenTime}</p>
                            <p><strong>Total Price:</strong> {waiting.totalPrice}</p>
                        </div>
                    ))}

                </div>

            </div>

        </div>
    );
};

export default WaitingList;