// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundMeTest is Test{

    FundMe fundMe;
    
    function setUp() external {
        fundMe = new FundMe();
    }

    function testMinimumDollarIsFive() public view{
        assertEq(fundMe.MINIMUM_USD(), 5e18);
    }

    function testOwnerIsMsgSender() public view {
        // us --> FundMeTEST --> FundMe
        // So the deployer of the FundMe is that TestContract "FundMeTest"
        assertEq(fundMe.i_owner(), address(this));

    }
}