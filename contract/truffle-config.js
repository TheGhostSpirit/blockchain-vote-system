const HDWalletProvider = require('@truffle/hdwallet-provider');

const mnemonic = 'treat acid radio liquid build spirit apple winner chronic lake hub hockey'.toString().trim();

module.exports = {
  networks: {
    rinkeby: {
      provider: () => new HDWalletProvider(mnemonic, `https://rinkeby.infura.io/v3/9c62614895c8482c924edd7726a1eaae`),
      network_id: 4,
      gas: 4500000,
      gasPrice: 10000000000,
    },
  },

  mocha: {},

  // Configure your compilers
  compilers: {
    solc: {
      version: "0.8.10",
    }
  },
};
