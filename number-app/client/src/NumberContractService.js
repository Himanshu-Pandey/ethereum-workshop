import abi from './NumberContractABI.json';
import Web3 from 'web3';

export default class NumberContractService {

    static instance = null;

    constructor(){
        this.web3 = new Web3(new Web3.providers.HttpProvider('http://127.0.0.1:7545'));
        this.gas = 0x47b760;
        this.loadContract('0xa54d39f03940bd6522d7ad3c6aa9c44a81f31247');
    }

    static getInstance() {
        if (NumberContractService.instance == null) {
            NumberContractService.instance = new NumberContractService();
        }
        return this.instance;
    }

    loadContract(address){
        this.contract = {};
        this.contract = new this.web3.eth.Contract(abi,address);
    }

    async getNumber() {
        return await this.contract.methods.getNumber().call();
    }

    async setNumber(num) {
        await this.contract.methods.setNumber(num).send({
            from: '0x193a461d2Dae8B7d2674a8A406212fe08A420887',
            gas: this.gas
        });
    }

    async getLastBlock(){
        return await this.web3.eth.getTransactionFromBlock('latest');
    }
}
