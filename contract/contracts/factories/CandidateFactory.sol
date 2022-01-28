// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import '@openzeppelin/contracts/utils/math/SafeMath.sol';
import '@openzeppelin/contracts/access/Ownable.sol';

import "../structs/Candidate.sol";

contract CandidateFactory is Ownable {

  using SafeMath for uint256;

  event NewCandidate(uint id, uint electionId, string firstname, string lastname);

  Candidate[] public candidates;

  mapping (uint => address) public candidateToOwner;
  mapping (address => mapping (uint => bool)) ownerIsCandidateForElection;

  function createCandidate(uint _electionId, string memory _firstname, string memory _lastname) public {
    candidates.push(Candidate(_electionId, _firstname, _lastname));
    uint candidateId = candidates.length - 1;
    candidateToOwner[candidateId] = msg.sender;

    require(!ownerIsCandidateForElection[msg.sender][_electionId], "Cannot be candidate more than once for the same election");

    ownerIsCandidateForElection[msg.sender][_electionId] = true;
    emit NewCandidate(candidateId, _electionId, _firstname, _lastname);
  }
}
