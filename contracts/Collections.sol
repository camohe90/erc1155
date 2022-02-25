// SPDX-License-Identifier: MIT
pragma solidity 0.8.6;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract MyCollectibles is ERC1155 {
    constructor() ERC1155("https://gateway.pinata.cloud/ipfs/QmZ1THcMMCGxB2fiZvoP31u44rweD5EUsfNV1RrKqwrxM1/{id}.json") {
        _mint(msg.sender, 1 /* Id 1 */, 10 /* Cantidad */, "");
        _mint(msg.sender, 2 /* Id 2      */, 20 /* Cantidad */, "");
    }
}

