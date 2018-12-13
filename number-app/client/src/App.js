import React, { Component } from 'react';
import './App.css';
import NumnerContractService from './NumberContractService';

class App extends Component {

  constructor(props) {
    super(props);
    this.state = { value: 0, lastBlock: {from: ''} };
    this.updateNumber = this.updateNumber.bind(this);
  }

  async componentDidMount(){
    await this.updateState();
  }

  updateNumber = async function () {
    let number = NumnerContractService.getInstance();
    await number.setNumber(this.textInput.value);
    await this.updateState();
  }

  updateState = async function(){
    let number = NumnerContractService.getInstance();
    
    this.setState({
      value: await number.getNumber(),
      lastBlock: await number.getLastBlock()
    });
  }

  render() {
    return (
      <div className="App">
        <div>
          <header className="App-header">
            <h1>{this.state.value}</h1>
            <h6>Updated by : <i>{this.state.lastBlock.from}</i></h6>
          </header>
          <div className="App-content">
            Enter a number:
            <input type="number" ref={(input) => this.textInput = input} >
            </input>
            <button onClick={this.updateNumber}>
              Update!
            </button>
          </div>
          <div className="App-content block">
            <h4>Block details</h4>
            <pre><i>{JSON.stringify(this.state.lastBlock, null, 2) }</i></pre>
          </div>
        </div>
      </div>
    );
  }
}

export default App;
