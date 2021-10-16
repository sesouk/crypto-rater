const main = async () => {
  const [deployer] = await hre.ethers.getSigners()
  const accountBalance = await deployer.getBalance()

  console.log("Summoning contracts with account: ", deployer.address);
  console.log("Gama-chan balance: ", accountBalance.toString());

  const Token = await hre.ethers.getContractFactory("CryptoRater")
  const portal = await Token.deploy()
  await portal.deployed()

  console.log("CryptoRater address: ", portal.address);
}

const runMain = async () => {
  try {
    await main()
    process.exit(0)
  } catch (error) {
    console.log(error);
    process.exit(1)
  }
}

runMain()