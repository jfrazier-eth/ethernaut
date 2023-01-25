// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

abstract contract AbstractCoinFlip {
    function flip(bool _guess) external virtual returns (bool);

    uint256 public FACTOR;

    constructor(uint256 _FACTOR) {
        FACTOR = _FACTOR;
    }
}
