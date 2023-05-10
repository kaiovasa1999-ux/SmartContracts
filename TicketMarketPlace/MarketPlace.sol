//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import "./Event.sol";

contract MarketPlace{
    address[] public events;
    
    uint256 ticketsSaleStart;
    uint256 ticketsSaleEnd;
    string name;
    uint256 ticketsPrice;
    string metadata;

    event AddEvent(address indexed createor,address eventAddress);

    function createEvent() external {
        address newEvent = address(new Event(ticketsSaleStart,ticketsSaleEnd,name,ticketsPrice,metadata));
        events.push(newEvent);

        emit AddEvent(msg.sender, newEvent);
    }
}