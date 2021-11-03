from vyper.interfaces import ERC721

implements: ERC721

interface ERC721:
    def safeTransferFrom(
            _from: address,
            _to: address,
            _tokenId: uint256,
            _data: Bytes[1024]=b""
        )


@external
def deposit(_from: address, _tokenId: uint256):
    tokenAddress: address
    ERC721(tokenAddress).safeTransferFrom(_from, self, _tokenId)
    
@external
def withdraw(_to: address, _tokenId: uint256):
    ERC721(tokenAddress).safeTransferFrom(self,_to,_tokenId)
    
    