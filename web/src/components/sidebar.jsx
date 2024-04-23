import React, { useState } from "react";
import { NavLink, useLocation } from 'react-router-dom';
import { FaHome, FaBars, FaList, FaUserAlt, FaSignOutAlt } from "react-icons/fa";
import logo from "../img/logo.png";



const SideBar = ({ children }) => {
    const [isOpen, setIsOpen] = useState(true);
    const location = useLocation();


    const menu = () => setIsOpen(!isOpen);
    const menuItem = [

        {
            path: "/home",
            name: "Home",
            icon: <FaHome />
        },
        {
            path: "/appointmentHistory",
            name: "History",
            icon: <FaList />
        },
        {
            path: "/courseBooked",
            name: "CourseHistory",
            icon: <FaList />
        },
        {
            path: "/staffProfile",
            name: "StaffProfile",
            icon: <FaUserAlt />
        },
        {
            path: "/waitingList",
            name: "WaitingList",
            icon: <FaList />
        },
        {
            path: "/login",
            name: "Logout",
            icon: <FaSignOutAlt />
        },
    ]

    
    if (location.pathname === "/login" || location.pathname === "/") {
        return <main>{children}</main>;
    }

    return (
        <div className="Container">
            <div style={{ width: isOpen ? "180px" : "55px" }} className="sidebar">
                <div className="top">
                    <h1 style={{ display: isOpen ? "block" : "none" }} className="logo"><img style={{height: "50px", width: "50px"}} src={logo} alt="Logo"></img></h1>
                    <div style={{ marginLeft: isOpen ? "70px" : "0px" }} className="bar">
                        <FaBars onClick={menu} />
                    </div> 
                </div>

                {
                    menuItem.map((item, index) => (
                        <NavLink to={item.path} key={index} className="link" activeclassName="active">
                            <div className="icon">{item.icon}</div>
                            <div style={{ display: isOpen ? "block" : "none" }} className="linkText">{item.name}</div>
                        </NavLink>

                        // { <NavLink to = {item.path} key={index} className={({ isActive }) => isActive ? 'link' : ''}>
                        // <div className="icon">{item.icon}</div>
                        // <div style={{display: isOpen? "block" : "none"}} className="link_text">{item.name}</div>
                        // </NavLink> }
                    ))
                }
            </div>
            <main>{children}</main>
        </div>
    );
};

export default SideBar;