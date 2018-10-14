pragma solidity ^0.4.24;

contract SimpleNumber {

  uint number;

  event NumberChanges(
      uint oldNumber,
      uint newNumber
  );

  function changeNumber(uint _newNumber) public{
    emit NumberChanges(number, _newNumber);
    number = _newNumber;
  }

  function getDouble() view public returns (uint) {
    return number*2;
  }

}
