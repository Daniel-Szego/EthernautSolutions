# Getting contract balance
web3.eth.getBalance(contract.address, function(error, result){ alert(result); })

# Deploy HackReentrancy contract with 1 ETH

# Getting custom balance of the deployed contract, should be one
(await contract.balanceOf("0xe684a30ec035649397de3152aa1a5309bc44ab70")).toNumber()

# Call hackWithdraw on HackReentrancy 

# Contract balance should be 0
web3.eth.getBalance(contract.address, function(error, result){ alert(result); })








  