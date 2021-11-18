
from vyper.interfaces import ERC721
owner:address

@external
def __init__():
    self.owner=msg.sender
    

interface ERC721Receiver:
    def onERC721Received(
            _operator: address,
            _from: address,
            _tokenId: uint256,
            _data: Bytes[1024]
        ) -> bytes32: view

implements: ERC721Receiver
@external
def deposit(_from: address, _tokenId: uint256,tokenAddress: address):
    #throws if caller is not the owner
    assert msg.sender==self.owner
    ERC721(tokenAddress).safeTransferFrom(_from, self, _tokenId,0x00) 
    
@external
def withdraw(_to: address, _tokenId: uint256,tokenAddress: address):
     #throws if caller is not the owner
    assert msg.sender==self.owner
    ERC721(tokenAddress).safeTransferFrom(self,_to,_tokenId,0x00)

@external
def onERC721Received(_operator: address,
            _from: address,
            _tokenId: uint256,
            _data: Bytes[1024])->bytes32:
    return method_id("onERC721Received(address,address,uint256,bytes)", output_type=bytes32)  

@external
def changeOwner(_newOwner:address):
            #throws if caller is not the owner
    assert msg.sender==self.owner
    self.owner=_newOwner

