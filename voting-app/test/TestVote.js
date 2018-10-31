var Vote = artifacts.require("./Vote.sol");

contract('Vote',function(){

  it('new vote contract should be deployed',async function(){
    var voteContract = await Vote.new();
    assert.notEqual(voteContract.address,"");
  });
  
});
