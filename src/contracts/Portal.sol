// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Ride {
    struct Passenger {
        address payable wallet;
        string name;
        uint seatNumber;
    }

    address payable public driver;
    string public origin;
    string public destination;
    uint public numSeats;
    uint public pricePerSeat;
    uint public numBookedSeats;
    mapping(uint => Passenger) public passengers;

    event RideCreated(address driver, string origin, string destination, uint numSeats, uint pricePerSeat);
    event SeatBooked(address passenger, string name, uint seatNumber, uint totalPrice);

    constructor(
        address payable _driver,
        string memory _origin,
        string memory _destination,
        uint _numSeats,
        uint _pricePerSeat
    ) {
        driver = _driver;
        origin = _origin;
        destination = _destination;
        numSeats = _numSeats;
        pricePerSeat = _pricePerSeat;
        numBookedSeats = 0;
        emit RideCreated(_driver, _origin, _destination, _numSeats, _pricePerSeat);
    }

    function bookSeat(string memory name) public payable {
    require(numBookedSeats < numSeats, "No more seats available");
    require(msg.value == pricePerSeat, "Incorrect payment amount");
    numBookedSeats++;
    uint seatNumber = numBookedSeats;
    passengers[seatNumber] = Passenger(payable(msg.sender), name, seatNumber); 
    emit SeatBooked(msg.sender, name, seatNumber, pricePerSeat);
}


    function withdraw() public {
        require(msg.sender == driver, "Only the driver can withdraw funds");
        uint balance = address(this).balance;
        driver.transfer(balance);
    }
}