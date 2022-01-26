// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import '@openzeppelin/contracts/utils/math/SafeMath.sol';

import "../structs/Candidate.sol";

contract CandidateFactory {

  using SafeMath for uint256;

  event NewCandidate(uint id, string firstname, string lastname);

  Candidate[] public candidates;

  mapping (uint => address) public candidateToOwner;

  function createCandidate(string _firstname, string _lastname) public {
    candidates.push(Candidate(_firstname, _lastname));
    uint id = candidates.length - 1;
    candidateToOwner[id] = msg.sender;

    emit NewCandidate(id, _firstname, _lastname);
  }
}
