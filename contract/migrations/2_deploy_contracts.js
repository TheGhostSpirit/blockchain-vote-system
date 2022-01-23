const Vote = artifacts.require('Vote');

module.exports = (deployer) => {
  deployer.deploy(Vote);
};
