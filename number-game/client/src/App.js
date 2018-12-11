import React, { Component } from 'react';
import './App.css';
import NumnerContractService from './NumberContractService';

class App extends Component {

  constructor(props) {
    super(props);
    let number = NumnerContractService.getInstance();
    this.state = { value: number.getNumber() || 0, updatedBy: number.getLastBlockUpdatedBy() };
    this.updateNumber = this.updateNumber.bind(this);
  }

  updateNumber = function () {
    let number = NumnerContractService.getInstance();
    number.setNumber(this.textInput.value);

    this.setState(({
      value: number.getNumber()
    }));
  }

  render() {
    return (
      <div className="App">
        <div>
          <header className="App-header">
            <h1>{this.state.value}</h1>
            <h6>Updated by : <i>{this.state.updatedBy}</i></h6>
          </header>
          <div>
            <br /><br /><br /><br /><br /><br />
            Enter a number:
            <input type="number" ref={(input) => this.textInput = input} >
            </input>
            <button onClick={this.updateNumber}>
              Update!
            </button>
          </div>
        </div>
      </div>
    );
  }
}

export default App;
