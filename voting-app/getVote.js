var Vote = artifacts.require("Vote");

module.exports = async function(callback) {
    var voteContract = await Vote.deployed();
    var votes = await voteContract.getVoteFor("A");
    console.log("Vote For A="+votes);
}
