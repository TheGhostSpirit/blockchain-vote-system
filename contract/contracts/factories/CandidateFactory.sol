// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import '@openzeppelin/contracts/utils/math/SafeMath.sol';

import "../structs/Candidate.sol";

contract CandidateFactory is Ownable {

  using SafeMath for uint256;

  event NewCandidate(uint id, uint electionId, string firstname, string lastname);

  Candidate[] public candidates;

  mapping (uint => address) public candidateToOwner;
  mapping (address => mapping (uint => uint)) ownerIsCandidateForElection;

  function createCandidate(uint _electionId, string _firstname, string _lastname) public {
    candidates.push(Candidate(_electionId, _firstname, _lastname));
    uint candidateId = candidates.length - 1;
    candidateToOwner[candidateId] = msg.sender;

    require(!ownerIsCandidateForElection[msg.sender][_electionId], "Cannot vote more than once");

    ownerIsCandidateForElection[msg.sender][_electionId] = candidateId;
    emit NewCandidate(id, _electionId, _firstname, _lastname);
  }
}
