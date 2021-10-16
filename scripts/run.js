const main = async () => {
  const [owner, randomPerson] = await hre.ethers.getSigners();
  const rateContractFactory = await hre.ethers.getContractFactory("CryptoRater");
  const rateContract = await rateContractFactory.deploy();
  await rateContract.deployed();

  console.log("Contract summoned at:", rateContract.address);
  console.log("Contract summoned by:", owner.address);

  let plusCount;
  plusCount = await rateContract.getPlus()

  let minusCount;
  minusCount = await rateContract.getMinus()

  let plusTxn = await rateContract.plus()
  await plusTxn.wait()

  let minusTxn = await rateContract.minus()
  await minusTxn.wait()

  plusCount = await rateContract.getPlus()
  minusCount = await rateContract.getMinus()

  plusTxn = await rateContract.connect(randomPerson).plus()
  await plusTxn.wait()

  plusCount = await rateContract.getPlus()
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