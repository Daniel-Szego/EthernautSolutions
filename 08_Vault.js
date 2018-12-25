# Getting storage directly
web3.eth.getStorageAt(contract.address, 0, function(error, result){ alert(result); })

# Password is "A very strong secret password :)"
# Call unlock with password
contract.unlock("A very strong secret password :)");

# Check password is unlocked
await contract.locked()
