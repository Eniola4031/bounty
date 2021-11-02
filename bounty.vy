from vyper.interfaces import ERC721

implements: ERC721


owner: address
_tokenId: uint256

@public
def --int--():
    self.owner = msg.sender

@view
@external
def ownerOf(_tokenId: uint256) -> address:
    """
    @dev Returns the address of the owner of the NFT.
         Throws if `_tokenId` is not a valid NFT.
    @param _tokenId The identifier for an NFT.
    """
    owner: address = self.idToOwner[_tokenId]
    # Throws if `_tokenId` is not a valid NFT
    assert owner != ZERO_ADDRESS
    return owner

    
 Deposit: event({owner: address, uint256: _tokenId})  
 
@public
def deposit():
    self.balance_of[address(this)] += msg.value
    log.Deposit(msg.sender, msg.value)
    
@public
def withdraw(_tokenId: uint256):
    self.balance_of[msg.sender] -= _tokenId
    send(msg.sender, _tokenId)