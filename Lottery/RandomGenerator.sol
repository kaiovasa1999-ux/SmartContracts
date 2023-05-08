
// SPDX-License-Identifier:MIT

pragma solidity ^0.8.1;


contract RandomGenerator{
    function Radnom(uint length) public view returns (uint256) {
        return uint(keccak256(abi.encodePacked(block.timestamp, block.difficulty))) % length;
    }
}
