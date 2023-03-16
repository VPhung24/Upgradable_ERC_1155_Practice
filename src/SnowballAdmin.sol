// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {AccessControl} from "openzeppelin-contracts/contracts/access/AccessControl.sol";
import {ProxyAdmin} from "openzeppelin-contracts/contracts/proxy/transparent/ProxyAdmin.sol";
import {ProxyAdmin} from "openzeppelin-contracts/contracts/proxy/transparent/ProxyAdmin.sol";
import {SnowballProxyContract} from "./SnowballProxyContract.sol";

contract SnowballAdmin is ProxyAdmin, AccessControl {
    bytes32 public constant ADMIN_ROLE = keccak256("ADMIN_ROLE");

    constructor() {
        _setupRole(ADMIN_ROLE, msg.sender);
    }

    modifier onlyAdmin() {
        require(hasRole(ADMIN_ROLE, msg.sender), "Caller is not an admin");
        _;
    }

    function grantAdmin(address account) public onlyAdmin {
        grantRole(ADMIN_ROLE, account);
    }

    function revokeAdmin(address account) public onlyAdmin {
        revokeRole(ADMIN_ROLE, account);
    }

    function transferAdmin(address account) public onlyAdmin {
        revokeAdmin(msg.sender);
        grantAdmin(account);
    }
}
