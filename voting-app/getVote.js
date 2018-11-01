var Vote = artifacts.require("Vote");

module.exports = async function(callback) {

  var voteContract = await Vote.deployed();
  console.log(`Total votes for A are ${await voteContract.getVoteFor("A")}`);

}
