var Number = artifacts.require("./Number.sol");

contract('Number',function(){

  it('Numbers should be added',async function(){
    var number = await Number.new();
    await number.setNumber(1);
    var one = await number.getNumber();
    assert.equal(1,one);
  });

});
