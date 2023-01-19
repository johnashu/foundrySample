// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Counter {
    uint256 public number;

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function increment() public {
        ++number;
    }

    function isTrue() public pure returns(bool){
        return true;
    }

    function addOne(uint x) external pure returns (uint){
        return ++x;
    }
}
