pragma solidity ^0.4.17;

contract Number{

    uint number;

    function setNumber(uint _num) public{
        number = _num;
    }

    function getNumber() public view returns(uint){
        return number;
    }
}
