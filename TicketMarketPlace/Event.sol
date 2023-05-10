//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

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


contract MyToken is ERC721, ERC721URIStorage, Ownable {
    constructor() ERC721("MyToken", "MTK") {}

    function safeMint(address to, uint256 tokenId, string memory uri)
        public
        onlyOwner
    {
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
    }

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }
}