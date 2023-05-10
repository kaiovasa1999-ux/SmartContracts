//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import "./Event.sol";

contract MarketPlace{
    address[] public events;

    event AddEvent(address indexed createor,address eventAddress);

    function createEvent() external {
        address newEvent = address(new Event());
        events.push(newEvent);

        emit AddEvent(msg.sender, newEvent);
    }
}