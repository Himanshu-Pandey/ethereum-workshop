pragma solidity ^0.4.24;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/SimpleNumber.sol";

contract TestSimpleNumber {
  function testSimpleNumber() {
    DeployedAddresses.SimpleNumber();
    SimpleNumber meta = SimpleNumber(DeployedAddresses.SimpleNumber());

    uint expected = 10000;

    Assert.equal(10000, expected, "Owner should have 10000 MetaCoin initially");
  }
}
