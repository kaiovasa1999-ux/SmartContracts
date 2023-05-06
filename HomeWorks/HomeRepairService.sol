// SPDX-License-Identifier:MIT

pragma solidity 0.8.19;


contract HomeRepairServiceAgency{

    
    mapping(uint => bool) public AlredyHaveRequest;
    mapping(uint => bool) public IsAcceptedRequest;
    mapping (uint=> mapping(string => uint)) clientsAndPays;
    mapping (uint=> mapping(string => uint)) featuresClientsAndPays;
    
    address owner;

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner,"You are not the Owner of this agency");
        _;
    }

    function AddRepairRequestClient(uint id, string memory desc, uint price) public {
        require(AlredyHaveRequest[id] == false);
        featuresClientsAndPays[id][desc] = price;
    }


    function AcceptRepairRequest(uint id, string memory desc, uint price) public {
        require(IsAcceptedRequest[id] == false,"You are alreay accepted");
        clientsAndPays[id][desc] = price;
    }

}