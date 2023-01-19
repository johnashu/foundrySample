// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;


contract Foo {
    function bar() view external {
        require(msg.sender == address(1), 'wrong address');
    }
}
