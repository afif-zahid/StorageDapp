require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

module.exports = {
  solidity: "0.8.19",
  networks: {
    sepolia: {
      url: process.env.ALCHEMY_RPC_URL,  // Use Sepolia RPC URL
      accounts: [process.env.PRIVATE_KEY]  // Your wallet private key
    }
  }
};
