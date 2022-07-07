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
    uint myuint = 1;

    // Local variable
    function getValue() public pure returns (uint256) {
        uint256 value = 1;
        return value;
    }
}
