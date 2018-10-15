pragma solidity ^0.4.22;

contract Vote {

  mapping (string => uint) votesMap;

  function vote(string candidate) public {
    votesMap[candidate]++;
  }

  function getVoteFor(string candidate) public view returns (uint) {
    return votesMap[candidate];
  }

}
