pragma solidity ^0.6.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";


contract WineNFT is ERC721 {

    uint256 _tokenIds;
    constructor() public ERC721("BottleId", "BID") {}

    function awardItem(address player, string memory tokenURI) public returns (uint256)
    {
        _tokenIds++;

        uint256 newItemId = _tokenIds;
        
        _mint(player, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }
}
