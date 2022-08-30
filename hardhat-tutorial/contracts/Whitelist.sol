//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Whitelist {
    // Max number of Whitelisted addresses allowed
    uint8 public maxWhitelistedAddresses;

    //create a mapping of whitelistedAddresses
    //if an address is whitelisted, we would set it as true, it,s false by default for all addresses
    mapping(address => bool) public whitelistedAddresses;

    //numAddressesWhitelisted would be used to keep track of how many addresseshave been whitelisted
    //Note: Don't change this variable name, as it will be part of the verification
    uint8 public numAddressesWhitelisted;

    //Setting the Max number of whitelisted addresses
    // We will put the value at time of deployment
    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    /**
     addAddressToWhitelist - this function adds the address 
     of the sender to the whitelist
     */

    function addAddressToWhitelist() public {
        //check if user has already been whitelisted
        require(
            !whitelistedAddresses[msg.sender],
            "Sender has already been whitelisted"
        );
        //check if the numAddressesWhitelisted < maxWhitelistedAddresses, if not then throw an error.
        require(
            numAddressesWhitelisted < maxWhitelistedAddresses,
            "Limit reached, no more addresses can be added"
        );
        // Add the address which called the contract to the whiteListAddress array
        whitelistedAddresses[msg.sender] = true;
        //increase the number of whitelisted addresses
        numAddressesWhitelisted += 1;
    }
}
