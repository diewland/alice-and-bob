// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC1155/presets/ERC1155PresetMinterPauser.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import {DefaultOperatorFilterer} from "operator-filter-registry/src/DefaultOperatorFilterer.sol";

contract AliceAndBob is ERC1155PresetMinterPauser, DefaultOperatorFilterer {

    string public name = "Alice and Bob";
    string public symbol = "ANB";

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

    // metadata
    string private baseURI;
    function setBaseURI(string calldata _newBaseURI) external {
        require(hasRole(DEFAULT_ADMIN_ROLE, _msgSender()), "setBaseURI require admin role");
        baseURI = _newBaseURI;
    }
    function tokenURI(uint tokenId) public view returns (string memory) {
        return string.concat(baseURI, Strings.toString(tokenId), ".json");
    }

    // https://github.com/ProjectOpenSea/operator-filter-registry/blob/main/src/example/ExampleERC1155.sol
    function setApprovalForAll(address operator, bool approved) public override onlyAllowedOperatorApproval(operator) {
        super.setApprovalForAll(operator, approved);
    }
    function safeTransferFrom(address from, address to, uint256 tokenId, uint256 amount, bytes memory data)
        public
        override
        onlyAllowedOperator(from)
    {
        super.safeTransferFrom(from, to, tokenId, amount, data);
    }
    function safeBatchTransferFrom(
        address from,
        address to,
        uint256[] memory ids,
        uint256[] memory amounts,
        bytes memory data
    ) public virtual override onlyAllowedOperator(from) {
        super.safeBatchTransferFrom(from, to, ids, amounts, data);
    }

}
