pragma solidity ^0.4.22;

contract SimpleNumber {

  uint number;
  address caller;

  event NumberChanged(
      uint oldNumber,
      uint newNumber
  );

  function changeNumber(uint _newNumber) public {
    require(_newNumber!=number);
    emit NumberChanged(number, _newNumber);
    caller = msg.sender;
    number = _newNumber;
  }

  function getDouble() public view returns (uint) {
    return number*2;
  }

  function getLastCaller() public view returns (address) {
    return caller;
  }

}
