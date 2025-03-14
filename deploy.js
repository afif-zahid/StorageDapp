const hre = require("hardhat");

async function main() {
  const Storage = await hre.ethers.getContractFactory("DecentralizedStorage");
  const storage = await Storage.deploy(); 
  await storage.waitForDeployment(); 

  console.log("Contract deployed to:", await storage.getAddress()); 
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
