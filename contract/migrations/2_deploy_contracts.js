const VoteFactory = artifacts.require('VoteFactory');
const CandidateFactory = artifacts.require('CandidateFactory');
const ElectionFactory = artifacts.require('ElectionFactory');

module.exports = (deployer) => {
  deployer.deploy(VoteFactory);
  deployer.deploy(CandidateFactory);
  deployer.deploy(ElectionFactory);
};
