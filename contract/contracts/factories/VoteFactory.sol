// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import '@openzeppelin/contracts/utils/math/SafeMath.sol';
import '@openzeppelin/contracts/access/Ownable.sol';

import "../structs/Vote.sol";

contract VoteFactory is Ownable {

  using SafeMath for uint256;

  event NewVote(uint id, uint _electionId, uint _candidateId);

  Vote[] public votes;

  mapping (uint => address) public voteToOwner;
  mapping (address => uint) ownerHasVoted;

  function createVote(uint _electionId, uint _candidateId) public {
    votes.push(Vote(_electionId, _candidateId));
    uint voteId = votes.length - 1;
    voteToOwner[voteId] = msg.sender;

    require(!ownerHasVoted[msg.sender], "Cannot vote more than once");

    ownerHasVoted[msg.sender] = voteId;
    emit NewVote(voteId, _electionId, _candidateId);
  }
}
