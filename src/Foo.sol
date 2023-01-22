// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import '@openzeppelin/contracts/access/Ownable.sol';

contract Foo is Ownable {
    function bar() view external {
        require(msg.sender == address(1), 'wrong address');
    }
}
