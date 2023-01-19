// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

// import "forge-std/Test.sol";
import "../src/Foo.sol";

interface Vm {
    function prank(address) external;
    function expectRevert(bytes calldata) external;
}

contract FooTest {
    Foo foo;

    // The VM is always at this address. Where does it come from?
    // address(bytes20(uint160(uint256(keccak256('hevm cheat code'))))) 
    //>>> 0x7109709ECfa91a80626fF3989D68f67F5b1DD12D
    Vm vm = Vm(0x7109709ECfa91a80626fF3989D68f67F5b1DD12D);

    function setUp() public {
        foo = new Foo();
    }

    function testBar() public {
        vm.prank(address(1));
        foo.bar();
    }

    function testBarRevert() public {
        vm.expectRevert('wrong address');
        foo.bar();
    }
}
