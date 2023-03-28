import React from "react";
import { useNavigate } from "react-router-dom";

export default function Home() {
const email = localStorage.getItem("email");
const account = localStorage.getItem("account");

const navigate = useNavigate();
return (
	<div>
	<h3>Your account: {account} </h3>
	<h3>Your email: {email} </h3>
	<button className=""> Create Ride</button>
	<button1
		style={button1}
		onClick={() => {
		localStorage.removeItem("email");
		localStorage.removeItem("account");
		window.location.reload();
		}}
	>
		{" "}
		Log out
	</button1>
	</div>
);
}
const button1 = {
width: 100,
padding: 10,
borderRadius: 5,
margin: 100,
cursor: "pointer",
fontSize: 17,
color: "white",
backgroundColor: "#9D27CD",
border: "none",
};

