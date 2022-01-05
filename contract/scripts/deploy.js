const main = async () => {
  const messagesFactory = await hre.ethers.getContractFactory("SendCryptoMessages");
  const messagesContract = await messagesFactory.deploy();

  await messagesContract.deployed();

  console.log("Transactions address: ", messagesContract.address);
};

const runMain = async () => {
  try {
    await main();
    process.exit(0);
  } catch (error) {
    console.error(error);
    process.exit(1);
  }
};

runMain();
