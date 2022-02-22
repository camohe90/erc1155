// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";



contract ImproveCollectible is ERC721, ERC721URIStorage, Ownable{
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;
    mapping (address=>uint256) owners_count;
    bytes32 public constant ROL_ADMIN = keccak256("ROL_ADMIN");
    bytes32 public constant ROL_USUARIO = keccak256("ROL_USUARIO");
    uint256 public maxSupply;
    uint256 public maxPerAccount;

    constructor (uint256 _maxSupply, uint256 _maxPerAccount) ERC721 ("Doggs", "DOG"){
        maxSupply = _maxSupply;
        maxPerAccount = _maxPerAccount;
    }

    function createCollectible(string memory tokenURI) public{
        uint256 tokenId = _tokenIdCounter.current();
        require(tokenId < maxSupply, "No art left");
        require(owners_count[msg.sender] < maxPerAccount, "You can't mint more tokens");
        _tokenIdCounter.increment();
        _safeMint(msg.sender, tokenId);
        _setTokenURI(tokenId, tokenURI);
        owners_count[msg.sender]++;
    }

    function tokenCounter()public view returns(uint256){
        return _tokenIdCounter.current();
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