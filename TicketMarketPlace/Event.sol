//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Event{
    uint256 _ticketsSaleStart;
    uint256 _ticketsSaleEnd;
    string _name;
    uint256 _ticketsPrice;
    string _metadata;
    
    constructor(uint256 ticketsSaleStart, uint256 ticketsSaleEnd, string memory name, uint256 ticketPrice, string memory _metadata){
        _ticketsSaleStart = ticketsSaleStart;
        _ticketsSaleEnd = ticketsSaleEnd;
        _name =  name;
        _ticketsPrice = ticketPrice;
        _metadata = _metadata;
    }
    
}