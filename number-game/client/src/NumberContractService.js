import abi from './NumberContractABI.json';
import Web3 from 'web3-quorum';

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
        this.contract = this.web3.eth.contract(abi).at(address);
    }

    getNumber() {
        return this.contract.getNumber().toNumber();
    }

    setNumber(id) {
        this.contract.setNumber(id,{
            from: this.web3.eth.accounts[0],
            gas: this.gas
        });
    }

    getLastBlockUpdatedBy(){
        return this.web3.eth.getTransactionFromBlock('latest').from;
    }
}
