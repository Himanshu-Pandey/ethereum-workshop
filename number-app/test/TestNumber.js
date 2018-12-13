var Number = artifacts.require("./Number.sol");

contract('Number',function(){

  it('A new Number contract should be deployed',async function(){
    var receipt = await Number.new();
    assert.isOk(receipt);
  });

  it('A new number added with proper receipt',async function(){
  });

  it('Number get is same as number set',async function(){
  });

});
