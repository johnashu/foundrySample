// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    uint testNumber = 42;

    address internal madeUp;

    function setUp() public {
        counter = new Counter();
        counter.setNumber(0);
        madeUp = makeAddr("Maffaz");
    }

    function testIncrement() public {
        counter.increment();
        assertEq(counter.number(), 1);
    }

    function testSetNumber(uint256 x) public {
        counter.setNumber(x);
        assertEq(counter.number(), x);
    }

    function testSetNumberRevert(uint256 x) public {
        vm.expectRevert(stdError.arithmeticError);
        counter.setNumber(type(uint256).max + 1);
        assertEq(counter.number(), x);
    }

    function testIsTrue() public {
        emit log_string("\nHello\n\tThis is gonna be True!!\nSent by:");
        emit log_address(msg.sender);
        emit log_named_address("\nOr is it this made up address??", madeUp);
        require(counter.isTrue(), "It is False!");
    }

    function testCannotSubtract43() public {
        vm.expectRevert(stdError.arithmeticError);
        testNumber -= 43;
    }

    function testAddOneHardCode() public {
        assertEq(counter.addOne(2), 3);
    }

    // Passes ok using constraints
    function testAddOneFuzzyWithVm(uint256 x) public {
        vm.assume(x < type(uint256).max - 1);
        assertEq(counter.addOne(x), x + 1);
    }

    // Fails with Over / Under Flow.. but < 256 runs
    function testAddOne128(uint128 x) public {
        assertEq(counter.addOne128(x), x + 1);
    }

    // Fails with Over / Under Flow.. > 256 runs
    function testAddOne256(uint256 x) public {
        assertEq(counter.addOne(x), x + 1);
    }

    // Passes no problem..
    function testFailAddOne(uint256 x) public {
        assertEq(counter.addOne(x), x + 2);
    }

    // Fails with Over / Under Flow..
    function testMinusOne(uint256 x) public {
        assertEq(counter.minusOne(x), x - 1);
    }

    // Passes no problem..
    function testFailMinusOne(uint x) public {
        assertEq(counter.minusOne(x), x - 2);
    }
}
