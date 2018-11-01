var Vote = artifacts.require("Vote");

module.exports = async function(callback) {

  var voteContract = await Vote.deployed();
  var receipt = await voteContract.castVote("A");
  console.log(voteContract.address);
  console.log(`Vote casted for A , receipt is ${receipt.tx}`);

}
