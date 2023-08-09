const hre = require("hardhat");

async function main() {

  const points = await hre.ethers.deployContract("DegenGamingToken");

  await points.waitForDeployment();

  console.log(
    `this contract has been depolyed to this address ${await points.getAddress()}`
  );
}
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
