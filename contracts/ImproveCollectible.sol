// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.8.0;


import '@openzeppelin/contracts/access/Ownable.sol';
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract ImproveCollectible is ERC721, Ownable {
    uint256 public tokenCounter;
    uint256 public constant MAX_SUPPLY = 10000;
    address public CREATOR = 0x9f4CA7F3BbF23f4Df191c7E1A7E96c22F706AD36;


    constructor () public ERC721 ("Doggsv2", "DOG"){
        tokenCounter = 0;
    }

    function createCollectible(string memory tokenURI) public payable returns (uint256) {
        uint256 newItemId = tokenCounter;
        _safeMint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);
        tokenCounter = tokenCounter + 1;
        return newItemId;
    }

    function withdrawAll() public
    {
        (bool success, ) = CREATOR.call{value:address(this).balance}("");
        require(success, "Transfer failed.");
    }
}
