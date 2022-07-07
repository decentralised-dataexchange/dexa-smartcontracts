// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * DEXA smartcontracts
 *
 * addDataSource() 	                            To add data source (address) to trusted data source registry
 * removeDataSource() 	                        To remove data source from trust data source registry
 * publishDDAContentIdentifier()	            To publish content identifier of DDA (Data Intermediary)
 * publishAccessToken(cipher_text, sig, nonce)	To publish encrypted access token
 *
 */

contract DEXA {
    // Mappings
    mapping(uint256 => string) public names;
    mapping(uint256 => Book) public books;
    mapping(address => mapping(uint256 => Book)) public mybooks;

    struct Book {
        string title;
        string author;
    }

    constructor() {
        names[1] = "Adam";
        names[2] = "Bruce";
        names[3] = "Carl";
    }

    function addBook(
        uint256 _id,
        string memory _title,
        string memory _author
    ) public {
        // Local variables are prefixed with "_" (Underscore) as part of convention
        books[_id] = Book(_title, _author);
    }

    function addMyBook(
        uint256 _id,
        string memory _title,
        string memory _author
    ) public {
        // Global variables
        // msg.sender -> Address of the individual who is calling the smartcontract function.

        mybooks[msg.sender][_id] = Book(_title, _author);
    }
}
