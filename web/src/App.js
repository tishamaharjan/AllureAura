import React, { useState } from 'react';
import './App.css';
import { BrowserRouter, Routes, Route } from "react-router-dom";
import SideBar from './components/sidebar';
import Login from './pages/Login.jsx';
import Home from './pages/home.jsx';
import History from './pages/AppointmentHistory.jsx';
import StaffProfile from './pages/StaffProfile.jsx';
import WaitingList from './pages/WaitingList.jsx';
import CourseHistory from './pages/CouseBooked.jsx';


const App = () => {
  const [isLoggedIn, setIsLoggedIn] = useState(false);
  return (
    <BrowserRouter>
      <SideBar isLoggedIn={isLoggedIn}>
        <Routes>
          <Route path="/" element={<Login setIsLoggedIn={setIsLoggedIn} />} />
          <Route path="/login" element={<Login setIsLoggedIn={setIsLoggedIn} />} />
          <Route path="/home" element={<Home />} />
          <Route path="/staffProfile" element={<StaffProfile />} />
          <Route path="/waitingList" element={<WaitingList />} />
          <Route path="/courseBooked" element={<CourseHistory />} />
          <Route path="/appointmentHistory" element={<History />} />
        </Routes>
      </SideBar>
    </BrowserRouter>
  );
}

export default App;
