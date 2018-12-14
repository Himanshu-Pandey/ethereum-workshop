pragma solidity ^0.4.17;

contract Number{
    
    uint num;
    
    function set(uint _num) public{
        num = _num;
    }
    
    function get() public view returns(uint){
        return num;
    }
}