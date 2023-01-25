// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Script.sol";

import {King} from "../src/king/King.sol";
import {KingForever} from "../src/king/KingForever.sol";

contract KingScript is Script {
    King king;
    uint256 playerKey;
    address playerAddr;

    function setUp() public {
        king = King(payable(0xc19039CF94A6a27b18e41489c333fB224EAA90Fc));
        playerKey = vm.envUint("PRIVATE_KEY");
        playerAddr = vm.addr(playerKey);
    }

    function run() public {
        vm.startBroadcast(playerKey);

        uint256 prize = king.prize();
        KingForever kingForever = new KingForever{value: prize}(king);

        require(king._king() == address(kingForever));
    }
}
