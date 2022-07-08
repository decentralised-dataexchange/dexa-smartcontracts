// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HotelRoom {
    // Ether payments
    // Modifiers
    // Visibility
    // Events
    // Enums

    // Event - emit an event anytime a booking happen
    // Solidity helps to emit an evit, whenever something happens in blockchain
    // To get an alert, notification or maintain a history of events in past
    event Occupy(address _occupant, uint256 _value);

    // Address of the account who owns the smart contract
    address payable public owner;

    // Hotel room status - Vacant / Occupied
    enum Statuses {
        Vacant,
        Occupied
    }

    // Current status of the hotel room
    Statuses public currentStatus;

    constructor() {
        // Address of account that deploys the smart contract is stored in owner state variable
        // payable() explicit typecasts address to payable address
        owner = payable(msg.sender);

        // Initialise the current status as vacant
        currentStatus = Statuses.Vacant;
    }

    modifier onlyWhileVacant() {
        // Make sure hotel room is vacant before permitting booking.
        require(currentStatus == Statuses.Vacant, "Currently occupied.");
        _;
    }

    modifier costs(uint256 _amount) {
        // Check if enough ether was provided while running the smart contract function
        require(msg.value >= _amount, "Not enough ether provided.");
        _;
    }

    // Book a room and pay the smart contract owner in ether
    function book() public payable onlyWhileVacant costs(2 ether) {
        // What is require()
        // If condition inside require is true, then next line of code is executed
        // If condition inside require is false, then next line of code is not executed

        // Update he hotel room status as occupied
        currentStatus = Statuses.Occupied;

        // msg.value - amount of ether when calling smart contract function

        // owner.transfer(msg.value);

        // There can be issues with account.transfer() function and transfer may not occur

        (bool sent, bytes memory data) = owner.call{value: msg.value}("");

        // Make sure the transfer of funds to owner occured.
        require(sent);

        // Emit occupy event with msg.sender - address that executes this function
        // msg.value - ether send to execute this function
        emit Occupy(msg.sender, msg.value);
    }
}
