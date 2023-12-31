// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC1155/presets/ERC1155PresetMinterPauser.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract AliceAndBob is ERC1155PresetMinterPauser {

    string public name = "Alice and Bob";
    string public symbol = "ANB";
    string private baseURI = "https://diewland.github.io/alice-and-bob-assets/json/";

    constructor() ERC1155PresetMinterPauser("") {

        // (optional) mint existing items
        _mint(msg.sender, 1, 1, "");  // Origin
        _mint(msg.sender, 2, 1, "");  // Millennium
        _mint(msg.sender, 3, 1, "");  // Sarah
        _mint(msg.sender, 4, 1, "");  // Hippy
        _mint(msg.sender, 5, 1, "");  // Monk
        _mint(msg.sender, 6, 1, "");  // Mask
        _mint(msg.sender, 7, 1, "");  // Astro
        _mint(msg.sender, 8, 1, "");  // Patricia
        _mint(msg.sender, 9, 1, "");  // Stefan
        _mint(msg.sender, 10, 1, ""); // Mali
        _mint(msg.sender, 11, 1, ""); // On Fire
        _mint(msg.sender, 12, 55, "");// Bored Town Art Contest
        _mint(msg.sender, 13, 1, ""); // Neo
        _mint(msg.sender, 14, 1, ""); // LUNGLEE
        _mint(msg.sender, 15, 1, ""); // Candy Chan
        _mint(msg.sender, 16, 1, ""); // Rare Candy
        _mint(msg.sender, 17, 1, ""); // Santa
    }

    // mint
    function adminMint(uint256 id, uint256 amount) public virtual {
        require(hasRole(DEFAULT_ADMIN_ROLE, _msgSender()), "admin only");
        mint(_msgSender(), id, amount, "");
    }

    // metadata
    function setBaseURI(string calldata _newBaseURI) external {
        require(hasRole(DEFAULT_ADMIN_ROLE, _msgSender()), "admin only");
        baseURI = _newBaseURI;
    }
    function tokenURI(uint tokenId) public view returns (string memory) {
        return string.concat(baseURI, Strings.toString(tokenId), ".json");
    }

}
