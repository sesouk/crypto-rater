const main = async () => {
  const [owner, randomPerson] = await hre.ethers.getSigners();
  const rateContractFactory = await hre.ethers.getContractFactory("CryptoRater");
  const rateContract = await rateContractFactory.deploy({
    value: hre.ethers.utils.parseEther("0.01")
  });
  await rateContract.deployed();

  console.log("Contract summoned at:", rateContract.address);
  console.log("Contract summoned by:", owner.address);
  
  let plusCount;
  plusCount = await rateContract.getPlus()

  let minusCount;
  minusCount = await rateContract.getMinus()

  let contractBalance = await hre.ethers.provider.getBalance(
    rateContract.address
  );

  console.log(
    "Gama-Chan balance: ",
    hre.ethers.utils.formatEther(contractBalance)
  );

  let plusTxn = await rateContract.plus("ETH going up")
  await plusTxn.wait()

  let minusTxn = await rateContract.minus("ETH going down")
  await minusTxn.wait()

  contractBalance = await hre.ethers.provider.getBalance(rateContract.address);
  console.log(
    "Gama-Chan balance: ",
    hre.ethers.utils.formatEther(contractBalance)
  );
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