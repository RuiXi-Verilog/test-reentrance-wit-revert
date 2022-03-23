//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

interface ITestee {
    function attack() external;
}

contract Testee {
    uint256 pre_reentrance_counter = 0;
    uint256 post_reentrance_counter = 0;

    function target(address addr) public {
        pre_reentrance_counter += 1;
        ITestee(addr).attack();
        post_reentrance_counter +=1;
    }
}
