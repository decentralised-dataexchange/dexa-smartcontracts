// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract MyContract {

    // Inheritance
    // Factories
    // Interaction

    string secret;
    address owner;

    constructor(string memory _secret) public {
        secret = _secret;
        owner = msg.sender;
    }

}