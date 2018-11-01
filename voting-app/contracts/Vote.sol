pragma solidity ^0.4.22;

contract Vote {

  mapping (string => uint) voteMap;

  function castVote(string candidate) public {
    voteMap[candidate]++;
  }

  function getVoteFor(string candidate) public view returns (uint) {
    return voteMap[candidate];
  }

}
