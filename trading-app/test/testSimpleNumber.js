let SimpleNumber = artifacts.require("./SimpleNumber.sol");

contract('SimpleNumber',function(){

  it('A number should be set',async function(){
    let number = await SimpleNumber.new();
    await number.changeNumber(1);
    assert.isOk(await number.changeNumber(1),"Everything is not OK!!!");
  });

});
