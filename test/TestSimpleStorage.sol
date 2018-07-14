pragma solidity ^0.4.2;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/SimpleStorage.sol";

contract TestSimpleStorage {

  function testItStoresAValue() public {
    SimpleStorage simpleStorage = SimpleStorage(DeployedAddresses.SimpleStorage());

    simpleStorage.registerChild("Jon Jee", true, "1995.07.04");

    Assert.equal(simpleStorage.getLastChild(), "Jon Jee", "It should store the value \"Jon Jee\".");
  }

}
