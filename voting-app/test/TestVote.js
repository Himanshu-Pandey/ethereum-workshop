var Vote = artifacts.require("./Vote.sol");

contract('Vote',function(){

  it('new vote contract should be deployed',async function(){
    var voteContract = await Vote.new();
    assert.notEqual(voteContract.address,"");
  });

  it('Vote should be added',async function(){
    var voteContract = Vote.new();
    var transactionReceipt = await voteContract.castVote("A");
    assert.notEqual(transactionReceipt.tx,"");
  });

});
