pragma solidity ^0.4.22;

contract Vote {

  mapping (string => uint) someMapping;

  function vote(string candidate) public {
    someMapping[candidate]=someMapping[candidate]+1;
  }

  function getVoteFor(string candidate) public view returns (uint) {
    return someMapping[candidate];
  }

}
