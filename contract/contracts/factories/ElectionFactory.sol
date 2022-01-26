// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import '@openzeppelin/contracts/utils/math/SafeMath.sol';

import "../structs/Election.sol";

contract ElectionFactory {

  using SafeMath for uint256;

  event NewElection(uint id, string name);

  Election[] public elections;
  
  mapping (uint => address) public electionToOwner;

  function getElections() public view returns (Election[] memory) {
    return (elections);
  }

  function createElection(string _name) public {
    elections.push(Election(_name));
    uint id = elections.length - 1;
    electionToOwner[id] = msg.sender;

    emit NewElection(id, _name);
  }
}
