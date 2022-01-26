// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import '@openzeppelin/contracts/utils/math/SafeMath.sol';
import '@openzeppelin/contracts/access/Ownable.sol';

import "../structs/Vote.sol";

contract VoteFactory is Ownable {

  using SafeMath for uint256;

  event NewVote(uint id, bool result);

  Vote[] public votes;

  mapping (uint => address) public voteToOwner;
  mapping (address => bool) ownerHasVoted;

  function createVote(bool _result) public {
    votes.push(Vote(true));
    uint id = votes.length - 1;
    voteToOwner[id] = msg.sender;

    require(!ownerHasVoted[msg.sender], "Cannot vote more than once");

    ownerHasVoted[msg.sender] = true;
    emit NewVote(id, _result);
  }
}