//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Event{
    uint256 ticketsSaleStart;
    uint256 ticketsSaleEnd;
    string name;
    uint256 ticketsPrice;
    string metadata;

    constructor(uint256 _ticketsSaleStart, uint256 _ticketsSaleEnd, string memory _name, uint256 _ticketPrice, string memory _metadata){
        ticketsSaleStart = _ticketsSaleStart;
        ticketsSaleEnd = _ticketsSaleEnd;
        name =  _name;
        ticketsPrice = _ticketPrice;
        metadata = _metadata;
    }
    
}