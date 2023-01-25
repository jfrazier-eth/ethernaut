// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Script.sol";
import {CoinFlipGuesser} from "../src/coin-flip/CoinFlipGuesser.sol";
import {AbstractCoinFlip} from "../src/coin-flip/AbstractCoinFlip.sol";

contract CoinFlipperGuesserScript is Script {
    CoinFlipGuesser guesser;
    AbstractCoinFlip coinFlip;

    function setUp() public {
        guesser = CoinFlipGuesser(0x5E10cE094B14d5C84C6F97816DBC7822abC41D3f);
        coinFlip = AbstractCoinFlip(0xcBDe7318CE17fA189b8ed1483C00ca337B0c856D);
    }

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        bool res = guesser.submitGuess(coinFlip);
        require(res, "guess failed");
    }
}
