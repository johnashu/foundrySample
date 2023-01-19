// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Counter.sol";


contract CounterTest is Test {
    Counter public counter;

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

    function testIsTrue() public {
        emit log_string("\nHello\n\tThis is gonna be True!!\nSent by:");
        emit log_address(msg.sender);
        emit log_named_address("\nOr is it this made up address??", madeUp);
        require(counter.isTrue(), "It is False!");
    }

    function testAddOne() public {
        assertEq(3, counter.addOne(2));
    }

    // function testAddOneFuzzy(uint256 x) public {
    //     assertEq(x + 1, counter.addOne(x));
    // }
}
