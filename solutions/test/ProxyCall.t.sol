// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Test.sol";
import "forge-std/Vm.sol";

import {Telephone} from "../src/telephone/Telephone.sol";
import {ProxyCall} from "../src/telephone/ProxyCall.sol";

contract ProxyCallTest is Test {
    Telephone telephone;
    ProxyCall proxyCall;

    function setUp() public {
        telephone = new Telephone();
        proxyCall = new ProxyCall();
    }

    function testForward() public {
        assertEq(telephone.owner(), address(this));
        address newOwner = address(0x1234567890123456789012345678901234567890);
        vm.prank(newOwner);
        proxyCall.forward(telephone);
        assertEq(telephone.owner(), newOwner);
    }
}
