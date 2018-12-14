import abi from './NumberContractABI.json';
import Web3 from 'web3';

export default class NumberContractService {

    static instance = null;

    constructor(){
        this.web3 = new Web3(new Web3.providers.HttpProvider('http://127.0.0.1:7545'));
        this.gas = 0x47b760;
        this.loadContract('0xef0765122204df76b45ef197deac9b58701ea2cb');
    }

    static getInstance() {
        if (NumberContractService.instance == null) {
            NumberContractService.instance = new NumberContractService();
        }
        return this.instance;
    }

    loadContract(address){
        this.contract = new this.web3.eth.Contract(abi,address);
    }

    async getNumber() {
        return await this.contract.methods.get().call();
    }

    async setNumber(num) {
        var accounts = await this.web3.eth.getAccounts();
        await this.contract.methods.set(num).send({
            from: accounts[0],
            gas: this.gas
        });
    }

    async getLastBlock(){
        return await this.web3.eth.getTransactionFromBlock('latest');
    }
}
