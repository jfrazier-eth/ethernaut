// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/CoinFlip.sol";
import "../src/CoinFlipGuesser.sol";

contract CoinFlipGuesserTest is Test {
    CoinFlipGuesser public guesser;
    CoinFlip public coinFlip;

    function setUp() public {
        guesser = new CoinFlipGuesser();
        coinFlip = new CoinFlip(
            57896044618658097711785492504343953926634992332820282019728792003956564819968
        );
    }

    function testSubmitGuess() public {
        bool result = guesser.submitGuess(coinFlip);

        assertEq(result, true);
    }
}
