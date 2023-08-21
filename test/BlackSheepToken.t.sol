//SPDX-License-Identifier:MIT

pragma solidity^ 0.8.18;

import {Test} from "forge-std/Test.sol";
import {tokenDeployScript} from "script/BlackSheepToken.s.sol";
import {BlackSheepToken} from "src/BlackSheepToken.sol";

contract BlackSheepTest is Test{

tokenDeployScript public tokenDeploy;
BlackSheepToken public token;

address Bob = makeAddr("bob");
address Alice = makeAddr("alice");

uint256 public constant STARTING_BALANCE = 100 ether;

function setUp() public {
tokenDeploy = new tokenDeployScript();
token = tokenDeploy.run();

vm.prank(msg.sender);
token.transfer(Bob, STARTING_BALANCE);
}

function testBodBalance() public {
    assertEq(STARTING_BALANCE,token.balanceOf(Bob));
}
 function testAllowanceWork() public {
    uint256 initialAllowance = 1000;

    vm.prank(Bob);
    token.approve(Alice, initialAllowance);

    vm.prank(Alice);
    token.transferFrom(Bob, Alice, 500);

    assertEq(token.balanceOf(Alice),500);
    assertEq(token.balanceOf(Bob),STARTING_BALANCE - 500);
 }
}