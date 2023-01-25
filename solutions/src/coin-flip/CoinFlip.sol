// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import {AbstractCoinFlip} from "./AbstractCoinFlip.sol";

contract CoinFlip is AbstractCoinFlip {
    uint256 public consecutiveWins;
    uint256 lastHash;

    constructor(uint256 _factor) AbstractCoinFlip(_factor) {
        consecutiveWins = 0;
        // 57896044618658097711785492504343953926634992332820282019728792003956564819968
    }

    function flip(bool _guess) public override returns (bool) {
        uint256 blockValue = uint256(blockhash(block.number - 1));

        if (lastHash == blockValue) {
            revert();
        }

        lastHash = blockValue;
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;

        if (side == _guess) {
            consecutiveWins++;
            return true;
        } else {
            consecutiveWins = 0;
            return false;
        }
    }
}
