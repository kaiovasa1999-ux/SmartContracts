// SPDX-License-Identifier:MIT

pragma solidity ^0.8.1;

import "./RandomGenerator.sol";
import "./ILottery.sol";


contract Lottery is ILottery{
    RandomGenerator randomGenerator;
    address owner;
    struct Client {
        address payable clientid;
        uint256 amount;
    }

    Client[] public clients;
    mapping(address => uint[]) public clintsAndTheirBids;
    mapping(address => bool) public IsClientExists;

    uint totalBids = 0;

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner, "You aren't the owner");
        _;
    }
    
    modifier IsClient(address id) {
        require(!IsClientExists[id], "Cleint already exists");
        _;
    }

    function AddClient(address payable clientid,uint256 bid) public IsClient(clientid) {
        require(bid >= 0.01 ether, "insufficient amount");
        require(clientid != address(0),"invalid addres!");
        require(clientid != owner,"Owner cannot participate");
        Client memory client = Client(clientid,bid);
        clients.push(client);
        emit AddClientEvent(clientid,bid);
    }

    // function MakeBid(address clientId, uint256 bid) public IsClient(clientId){
    //     require(bid >= 0.01 ether, "insufficient amount");
    //     clintsAndTheirBids[clientId].push(bid);
    //     totalBids += bid;
    // }

    function DrawTheWinner() public onlyOwner {
        uint randomClient = randomGenerator.Radnom(clients.length);
        Client memory winner = clients[randomClient];
        winner.amount += totalBids;
        totalBids = 0;
        emit DrawWinner(winner.clientid);
    }
}