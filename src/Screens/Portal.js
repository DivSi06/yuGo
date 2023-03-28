import React from "react";
import { loadBlockchainData, loadWeb3 } from "../Web3helpers";
import { useNavigate } from "react-router-dom";

export default function CreateRide() {
    const [origin, setOrigin] = React.useState("");
    const [destination, setDestination] = React.useState("");
    const [numSeats, setSeats] = React.useState("");
    const [pricePerSeat, setPrice] = React.useState("");
    const navigate = useNavigate();
};