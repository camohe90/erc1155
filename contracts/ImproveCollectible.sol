// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

import '@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol';
import '@openzeppelin/contracts/access/Ownable.sol';


contract ImproveCollectible is ERC721Enumerable, Ownable {
    uint256 public tokenCounter;
    address account1 = "";
    address account2 = "";
    uint256 public constant MAX_SUPPLY = 10000;


    constructor () public ERC721 ("Doggs", "DOG"){
        tokenCounter = 0;
    }

    function createCollectible(string memory tokenURI) public payable returns (uint256) {
        uint256 newItemId = tokenCounter;
        _safeMint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);
        tokenCounter = tokenCounter + 1;
        return newItemId;
    }

    function withdrawTeam(uint256 amount) public payable onlyOwner {
        uint256 percent = amount / 100;
        require(payable(account1).send(percent * 50));
        require(payable(account2).send(percent * 50));
        
    }



}
