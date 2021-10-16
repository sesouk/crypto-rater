const main = async () => {
  const rateContractFactory = await hre.ethers.getContractFactory("CryptoRater");
  const rateContract = await rateContractFactory.deploy();
  await rateContract.deployed();
  console.log("Contract summoned at:", rateContract.address);
}

const runMain = async () => {
  try {
    await main()
    process.exit(0)
  } catch {
    console.log(error);
    process.exit(1)
  }
}

runMain()