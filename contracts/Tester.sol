pragma solidity ^0.8.0;

interface ITestee {
    function target(address addr) external;
}

contract Tester {
    uint256 reenter_counter = 0;
    ITestee victim;

    constructor(address addr) {
        victim = ITestee(addr);
    }

    function attack() public {
        if (reenter_counter < 5) {
            reenter_counter += 1;
            victim.target(address(this));
        }
    }
}
