pragma solidity ^0.6.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";


contract WineNFT is ERC721 {

    uint256 _tokenIds;
    
    struct tokendetails{
        string URI;
        uint256 tokenid;
        bool URIadded;
    }
    
    mapping (string => tokendetails) uriTokeIdMapping;
    
    constructor() public ERC721("BottleId", "BID") {}

    function bottleNFT(address buyer, string memory tokenURI) public
    {
        
        tokendetails memory td = tokendetails("", 0, false);
        
        if(!uriTokeIdMapping[tokenURI].URIadded) {
        
        _tokenIds++;
        uint256 newItemId = _tokenIds;
        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);
        td = tokendetails(tokenURI, newItemId, true);
        uriTokeIdMapping[tokenURI] = td;
            
        }
        
        else{
            
            uint256 temptokenid = uriTokeIdMapping[tokenURI].tokenid;
            _transfer(msg.sender, buyer, temptokenid);
            
        }
    }
}
