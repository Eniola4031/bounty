#interface ERC721:
@external
def safeTransferFrom(
            _from: address,
            _to: address,
            _tokenId: uint256,
            _data: Bytes[1024]=b""
    ):


tokenAddress: address


@external
def deposit(_from: address, _tokenId: uint256):
    ERC721(self.tokenAddress).safeTransferFrom(_from, self, _tokenId)
    
@external
def withdraw(_to: address, _tokenId: uint256):
    ERC721(self.tokenAddress).safeTransferFrom(self,_to,_tokenId)
    
    