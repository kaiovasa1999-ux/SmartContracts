// SPDX-License-Identifier:MIT

pragma solidity 0.8.19;


contract Lottery{
    struct Client {
        address id;
        uint256 amount;
    }

    Client public
    Client[] public clients;
    mapping(address => uint[]) public clintsAndTheirBids;
    mapping(address => bool) public IsClientExists;
    
    modifier IsClient(address id) {
        require(!IsClientExists[id], "Cleint already exists");
        _;
    }

    function AddClient(address id,uint256 bid) public IsClient(id) {
        require(bid >= 0.01 ether, "insufficient amount");
        Client memory client = Client(id,bid);
        clients.push(clinet);
    }
}