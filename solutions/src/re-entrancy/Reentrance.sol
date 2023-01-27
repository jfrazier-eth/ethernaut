// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

interface Reentrance {
    function donate(address _to) external payable;

    function balanceOf(address _who) external view returns (uint balance);

    function withdraw(uint _amount) external;

    receive() external payable;
}
