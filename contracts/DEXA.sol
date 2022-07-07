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
    // State variables
    // State is maintained in the blockchain and it can be updated.

    // Types of integers
    // https://docs.soliditylang.org/en/latest/types.html#integers
    int256 public myint = 1;
    uint256 public myuint = 1;
    uint256 public myuint256 = 1;
    uint8 public myuint8 = 1;

    // String
    string public mystring = "Hello, world!";

    // Store string in bytes32 format
    // Get different flexibility that is not available for strings
    bytes32 public mybytes32string = "Hello, world!";

    // Local variable
    function getValue() public pure returns (uint256) {
        uint256 value = 1;
        return value;
    }
}
