var SimpleNumber = artifacts.require("./SimpleNumber.sol");

module.exports = function(deployer) {
  deployer.deploy(SimpleNumber);
};
