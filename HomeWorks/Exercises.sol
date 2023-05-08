// SPDX-License-Identifier:MIT

pragma solidity 0.8.19;


contract Demo{
    uint256 public startTime;
    uint256 public endTime;

    event NewVote(address indexed stakeholder);

    constructor(uint256 start, uint256 end){
        require(start < end,"Invalid period!");
        startTime = start;
        endTime = end;
    }

    function vote(address stakeholder) external{
        emit  NewVote(stakeholder);
    }
}
