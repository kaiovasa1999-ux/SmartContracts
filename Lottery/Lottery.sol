// SPDX-License-Identifier:MIT

pragma solidity ^0.8.1;


contract Lottery{

    address owner;

    struct Client {
        address clientid;
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

    function AddClient(address clientid,uint256 bid) public IsClient(clientid) {
        require(bid >= 0.01 ether, "insufficient amount");
        Client memory client = Client(clientid,bid);
        clients.push(client);
    }

    function MakeBid(address clientId, uint256 bid) public IsClient(clientId){
        require(bid >= 0.01 ether, "insufficient amount");
        clintsAndTheirBids[clientId].push(bid);
        totalBids += bid;
    }
}