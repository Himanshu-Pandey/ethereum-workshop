var Vote = artifacts.require("./Vote.sol");
var keys = ["8QH4amW71rBaqRBYG88RUDb315n/6Uwxu23Z7AJK520=","iJu6KyfufTt9ApXiDvh5BKsCOfvpvQeZnvEs7Vd+Nwo=","rA+wtw+8xg3IkIEKxA1Y/5mPljYh63jDhgQxc57G+B0="];

module.exports = function(deployer) {
  deployer.deploy(Vote);
};
