// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/SnowballUpgradableToken.sol";
import "openzeppelin-contracts/contracts/utils/Strings.sol";

contract SnowballUpgradableTokenTest is Test {
    SnowballUpgradableToken public token;

    function setUp() public {
        token = new SnowballUpgradableToken();
    }

    function testURI() public {
        string memory uri = token.uri(314592);
        emit log_string(uri);
        assertEq(uri, "https://uri.viviantoken.com/0x04cce0.json"); // hx serverside
    }

    function testMinterRole() public {
        token.grantRole(token.MINTER_ROLE(), 0x7FA9385bE102ac3EAc297483Dd6233D62b3e1496);

        assertEq(token.hasRole(token.MINTER_ROLE(), 0x7FA9385bE102ac3EAc297483Dd6233D62b3e1496), true);
    }

    function testPauserRole() public {
        token.grantRole(token.PAUSER_ROLE(), 0x7FA9385bE102ac3EAc297483Dd6233D62b3e1496);

        assertEq(token.hasRole(token.PAUSER_ROLE(), 0x7FA9385bE102ac3EAc297483Dd6233D62b3e1496), true);
    }

    function testURISetterRole() public {
        token.grantRole(token.URI_SETTER_ROLE(), 0x7FA9385bE102ac3EAc297483Dd6233D62b3e1496);

        assertEq(token.hasRole(token.URI_SETTER_ROLE(), 0x7FA9385bE102ac3EAc297483Dd6233D62b3e1496), true);
    }

    function testDefaultAdminRole() public {
        token.grantRole(token.DEFAULT_ADMIN_ROLE(), 0x7FA9385bE102ac3EAc297483Dd6233D62b3e1496);

        assertEq(token.hasRole(token.DEFAULT_ADMIN_ROLE(), 0x7FA9385bE102ac3EAc297483Dd6233D62b3e1496), true);
    }

    function testPause() public {
        token.pause();

        assertEq(token.paused(), true);
    }

    function testUnpause() public {
        token.pause();
        token.unpause();

        assertEq(token.paused(), false);
    }

    function testSetURI() public {
        token.setURI("https://new.uri.viviantoken.com");

        assertEq(token.uri(0), "https://uri.viviantoken.com/0x00.json");
    }

    function testGrantRole() public {
        token.grantRole(token.DEFAULT_ADMIN_ROLE(), address(this));

        assertEq(token.hasRole(token.DEFAULT_ADMIN_ROLE(), address(this)), true);
    }

    // function testRevokeRolePublic() public {
    //     // token.grantRolePublic(token.MINTER_ROLE(), address(0x0));
    //     // token.revokeRolePublic(token.MINTER_ROLE(), address(0x0));

    //     // assertEq(token.hasRole(token.MINTER_ROLE(), address(0x0)), false);
    // }

    // function testBalanceOf() public {
    //     assertEq(token.balanceOf(address(this), 0), 0);
    // }

    // function testTotalSupply() public {
    //     assertEq(token.totalSupply(0), 0);
    // }

    // function testMint() public {
    //     token.mint(address(0x0), 0, 100, "");

    //     assertEq(token.balanceOf(address(0x0), 100), 100);
    // }

    // function testTransfer() public {
    //     token.transfer(address(0x1), 100);

    //     assertEq(token.balanceOf(address(0x0), 0), 0);
    //     assertEq(token.balanceOf(address(0x1), 100), 100);
    // }

    // function testTransferFrom() public {
    //     token.grantRolePublic(token.MINTER_ROLE(), address(0x1));
    //     token.transferFrom(address(0x1), address(0x2), 100);

    //     assertEq(token.balanceOf(address(0x0), 0), 0);
    //     assertEq(token.balanceOf(address(0x2), 100), 100);
    // }
}
