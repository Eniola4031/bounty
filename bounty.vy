
from vyper.interfaces import ERC721
owner:address

# Interface for the contract called by safeTransferFrom()
interface ERC721:
    def safeTransferFrom(
            _to: address,

#set contract owner to msgsender
@external
def __init__():
    self.owner=msg.sender

#implements the withdraw and deposit function
interface ERC721Receiver:
    def onERC721Received(
            _operator: address,
            _from: address,
            _tokenId: uint256,
            _data: Bytes[1024]
        ) -> bytes32: view

#you have to approve caller first to call the deposit and withdraw functions

implements: ERC721Receiver
@external
def deposit(_from: address, _tokenId: uint256,tokenAddress: address):
    #throws if caller is not the owner
    assert msg.sender==self.owner
    ERC721(tokenAddress).safeTransferFrom(_from, self, _tokenId,0x00) 

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
