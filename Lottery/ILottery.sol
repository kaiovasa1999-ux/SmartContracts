//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

interface ILottery{

    event AddClientEvent(address payable indexed id, uint bid);
    event DrawWinner(address indexed winnerId);


    function AddClient(address payable clientid,uint256 bid) external;
    function MakeBid(address clientId, uint256 bid) external;
    function DrawTheWinner() external;
}