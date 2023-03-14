// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/SnowballProxyContract.sol";

contract SnowballProxyContractTest is Test {
    SnowballProxyContract public proxyContract;

    function setUp() public {
        proxyContract = new  SnowballProxyContract();
    }

    function testSetNumber() public {
        proxyContract.setNumber(10);
    }
}
