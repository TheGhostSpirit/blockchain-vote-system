// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import '@openzeppelin/contracts/utils/math/SafeMath.sol';

import "../structs/Vote.sol";
import "../structs/Referendum.sol";

contract ElectionFactory {

  using SafeMath for uint256;

  event NewElection(uint id, string name);

  Candidats[] public candidats;
  Election public election = Election("election presidentielle");

  VoteFactory public voteFactory = VoteFactory();

  function getReferendumResults() public view returns (Referendum memory, Vote[] memory) {
    return (referendum, votes);
  }

  function createVote(bool _result) public {
    votes.push(Vote(true));
    uint id = votes.length - 1;
    voteToOwner[id] = msg.sender;

    require(!ownerHasVoted[msg.sender], "Cannot vote more than once");

    ownerHasVoted[msg.sender] = true;
    emit NewVote(id, _result);
  }
}
