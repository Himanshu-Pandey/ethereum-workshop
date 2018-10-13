module.exports = function(callback) {
  web3.personal.unlockAccount(web3.eth.accounts[0], '', 0);
  console.log('Account unlocked....');
};
