pragma solidity ^0.4.18;

contract SimpleStorage {

  event NewChild(uint childId, string name);

  struct Child {
    string name;
    bool isMale;
    string birthDate;
  }

  Child[] public children;

  mapping (uint => address) public childToOwner;
  mapping (address => uint) ownerChildCount;

  function registerChild(string name, bool isMale, string birthDate) public {
    uint id = children.push(Child(name, isMale, birthDate)) - 1;
    childToOwner[id] = msg.sender;
    ownerChildCount[msg.sender]++;
    NewChild(id, name);
  }

  function getLastChild() public view returns (string) {
    require(children.length > 0);
    return children[children.length - 1].name;
  }
}
