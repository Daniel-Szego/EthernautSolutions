# Getting balance of current account
(await contract.balanceOf(player)).toNumber()

# Approve another contract
contract.approve("0x41abAcf0951018c84742B187225842644Cb30312", 1000000 * (10 ** 18))

# Check aprovance
(await contract.allowance(player,"0x41abAcf0951018c84742B187225842644Cb30312")).toNumber()

# Transferfrom, with solidity contract from the alowed account

# check new balance
(await contract.balanceOf(player)).toNumber()



  