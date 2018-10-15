pragma solidity ^0.4.24;

contract Trade {

  mapping (string => uint) accountBalance;
  mapping (string => uint) items;
  uint UNIT_PRICE = 5;
  uint UNIT_COUNT = 10;

  //initial seeding of balances and items
  constructor(){
    accountBalance["BOB"]=UNIT_PRICE*UNIT_COUNT;
    accountBalance["ALICE"]=UNIT_PRICE*UNIT_COUNT;

    items["BOB"]=UNIT_COUNT;
    items["ALICE"]=UNIT_COUNT;
  }

  function sell(string seller,string buyer,uint itemCount) public{
    items[seller]=items[seller]-itemCount;
    items[buyer]=items[buyer]+itemCount;

    accountBalance[seller]=accountBalance[seller]+UNIT_PRICE*itemCount;
    accountBalance[buyer]=accountBalance[buyer]-UNIT_PRICE*itemCount;
  }

  function getBalance(string trader) public view returns (uint) {
    return accountBalance[trader];
  }

  function getItemCount(string trader) public view returns (uint) {
    return items[trader];
  }

}
