let Web3 = require('web3');
let abi,byteCode;
let web3 = new Web3();
let fs = require('fs');
let accountAddress;

function init(){
  let source = fs.readFileSync('./build/contracts/Vote.json', 'utf8');
  let contracts = JSON.parse(source);
  abi = contracts.abi;
  byteCode = contracts.bytecode;
  web3.setProvider(new web3.providers.HttpProvider('http://10.133.124.145:22001'));
}

async function unlockFirstAccount(web3) {
    console.log(`Unlocking account...`);
    var allAccounts = await web3.eth.getAccounts();
    await web3.eth.personal.unlockAccount(allAccounts[0], "", 0);
    console.log(`Account ${allAccounts[0]} unlocked`);
    accountAddress = allAccounts[0];
}

async function deployContract(web3,accountAddress) {
    let newContract = new web3.eth.Contract(abi);
    console.log(`Deploying Vote contract`);
    var tx = await newContract.deploy({data: byteCode,arguments: {}})
    .send({
        from: accountAddress,
        gas: 4700000,
        gasPrice: '0'
        // ,privateFor: privateForList
    });
    console.log(tx._address);
    return tx._address;
}

(async function (){
    let source = fs.readFileSync('./build/contracts/Vote.json', 'utf8');
    let contracts = JSON.parse(source);
    init();
    await unlockFirstAccount(web3);
    let contractAddress = await deployContract(web3,accountAddress);
    contracts.networks["1337"]={"address":contractAddress};
    fs.writeFileSync('./build/contracts/Vote.json', JSON.stringify(contracts));
    console.log('done');
})();
