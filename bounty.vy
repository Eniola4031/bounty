#from vyper.interfaces import ERC721

#implements: ERC721

# Interface for the contract called by safeTransferFrom()
interface ERC721:
    def safeTransferFrom(
            _to: address,
            _from: address,
            _tokenId: uint256,
        ) -> bytes32: view

tokenAddress: address


@external
def deposit(_from: address, _tokenId: uint256):
    ERC721(self.tokenAddress).safeTransferFrom(_from, self, _tokenId)
    
@external
def withdraw(_to: address, _tokenId: uint256):
    ERC721(self.tokenAddress).safeTransferFrom(self,_to,_tokenId)
    
    