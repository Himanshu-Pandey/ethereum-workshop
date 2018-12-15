var Migrations = artifacts.require("./Migrations.sol");
var Number = artifacts.require("./Number.sol");

module.exports = function(deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(Number);
};
