var SimpleStorage = artifacts.require("./SimpleStorage.sol");

contract('SimpleStorage', function(accounts) {

  it("...should store the value \"Jon Jee\".", function() {
    return SimpleStorage.deployed().then(function(instance) {
      simpleStorageInstance = instance;

      return simpleStorageInstance.registerChild("Jon Jee", true, "1995.07.04", {from: accounts[0]});
    }).then(function() {
      return simpleStorageInstance.getLastChild.call();
    }).then(function(storedData) {
      assert.equal(storedData, "Jon Jee", "The value \"Jon Jee\" was not stored.");
    });
  });

});
