import React, { useState, useEffect } from "react";
import axios from 'axios';
import { toast } from "react-toastify";

const CourseHistory = () => {
    const [courses, setCourses] = useState([]);
    const [error, setError] = useState(null);

    useEffect(() => {
        const getCourseDetails = async () => {
            try {
                const response = await axios.get('http://localhost:3005/course');
                setCourses(response.data);// Storing appointments data in a state
            } catch (error) {
                setError(`Failed to get appointment details: ${error.message}`);
                toast.error('Error fetching appointments:', error);
            }
        };

        getCourseDetails();
    }, []);

    return (
        <div>
            <div style={{ textAlign: "center" }}>
                <i><h1>Booked Courses</h1></i>
            </div>

            {error && <div>{error}</div>}
            <div className="maindiv">
                <div style={{ height: "100%", padding: "10px", minWidth: "50%" }}>
                    {courses.map((appointment, index) => (
                        <div key={index} style={{ marginBottom: "10px",textAlign: "center", padding: "10px", border: "1px solid black", borderRadius: "5px", backgroundColor: "#F1EAFF" }}>
                            <p><strong>Username:</strong> {appointment.username}</p>
                            <p><strong>Service:</strong> {appointment.chosenService}</p>
                            <p><strong>Total Price:</strong> {appointment.totalPrice}</p>
                        </div>
                    ))}

                </div>

            </div>

        </div>
    );
};

export default CourseHistory;