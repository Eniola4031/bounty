from vyper.interfaces import ERC721

implements: ERC721


owner: address
_tokenId: uint256
balance_of: map(address, wei_value)

@public
def --int--():
    self.owner = msg.sender
    
 Deposit: event({owner: address, amount: wei_value})  
 
@public
@payable
def deposit():
    self.balance_of[msg.sender] += msg.value
    log.Deposit(msg.sender, msg.value)
    
@public
def withdraw(amount: wei_value):
    self.balance_of[msg.sender] -= amount
    send(msg.sender, amount)