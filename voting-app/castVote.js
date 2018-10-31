var Vote = artifacts.require("Vote");

module.exports = async function(callback) {
    var voteContract = await Vote.deployed();
    console.log(voteContract.address);
    var receipt = await voteContract.vote("A");
    console.log("Vote casted and hash is "+receipt.tx);
}
