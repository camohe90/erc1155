// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/utils/Counters.sol";



contract ImproveCollectible is ERC721, ERC721URIStorage, ERC721Burnable, AccessControl, Pausable{
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;
    mapping (address=>uint256) owners_count;
    bytes32 public constant PAUSER_ROLE = keccak256("PAUSER_ROLE");
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    uint256 public maxSupply;
    uint256 public maxPerAccount;

    constructor (uint256 _maxSupply, uint256 _maxPerAccount) ERC721 ("Doggs", "DOG"){
        maxSupply = _maxSupply;
        maxPerAccount = _maxPerAccount;
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(MINTER_ROLE, msg.sender);
        _grantRole(PAUSER_ROLE, msg.sender);
    }

    function pause() public onlyRole(PAUSER_ROLE) {
        _pause();
    }

    function unpause() public onlyRole(PAUSER_ROLE) {
        _unpause();
    }

    function createCollectible(address to, string memory tokenURI) public onlyRole(MINTER_ROLE){
        uint256 tokenId = _tokenIdCounter.current();
        require(tokenId < maxSupply, "No art left");
        require(owners_count[to] < maxPerAccount, "You can't mint more tokens");
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, tokenURI);
        owners_count[to]++;
    }


    function getCountByAccout(address account) public onlyRole(MINTER_ROLE) returns(uint256){
        return owners_count[account];
    }
   

    function _beforeTokenTransfer(address from, address to, uint256 tokenId)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    function tokenCounter()public view returns(uint256){
        return _tokenIdCounter.current();
    }


    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    // The following functions are overrides required by Solidity.

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, AccessControl)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
   
}