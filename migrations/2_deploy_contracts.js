var SimpleBank = artifacts.require("./SimpleBank.sol");

module.exports = function(deployer) {
  deployer.deploy(SimpleBank, { value: 2});
};
