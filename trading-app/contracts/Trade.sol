pragma solidity ^0.4.24;

contract Trade {

  mapping (address => uint) accountBalance;
  mapping (address => uint) items;
  uint UNIT_PRICE = 5;
  uint UNIT_COUNT = 10;

  //initial seeding of balances and items
  constructor(){
    accountBalance[0xe050f4397afa2d73cc00003f754405e5764010e7]=UNIT_PRICE*UNIT_COUNT;
    accountBalance[0xc2d7cf95645d33006175b78989035c7c9061d3f9]=UNIT_PRICE*UNIT_COUNT;

    items[0xe050f4397afa2d73cc00003f754405e5764010e7]=UNIT_COUNT;
    items[0xc2d7cf95645d33006175b78989035c7c9061d3f9]=UNIT_COUNT;
  }

  function sell(address buyer,uint itemCount) public{
    require(items[msg.sender]>=itemCount);
    require(accountBalance[buyer]>=UNIT_PRICE*itemCount);

    items[msg.sender]=items[msg.sender]-itemCount;
    items[buyer]=items[buyer]+itemCount;

    accountBalance[msg.sender]=accountBalance[msg.sender]+UNIT_PRICE*itemCount;
    accountBalance[buyer]=accountBalance[buyer]-UNIT_PRICE*itemCount;
  }

  function getBalance() public view returns (uint) {
    return accountBalance[msg.sender];
  }

  function getItemCount() public view returns (uint) {
    return items[msg.sender];
  }

}
