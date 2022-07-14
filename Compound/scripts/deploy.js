async function main() {
  const LiquidityPool = await ethers.getContractFactory("LiquidityPool");

  // Start deployment, returning a promise that resolves to a contract object
  const liquidity_pool = await LiquidityPool.deploy(
    "0xb33E4766fCE016B214e2F64b90243b4248bDd217",
    "0x0D50AB2b552A2D2e6cdaFd367e6e78f392A2f06F",
    "0xb33E4766fCE016B214e2F64b90243b4248bDd217",
    "0x0D50AB2b552A2D2e6cdaFd367e6e78f392A2f06F",
    "0x0D50AB2b552A2D2e6cdaFd367e6e78f392A2f06F"
  );
  console.log("Contract deployed to address:", liquidity_pool.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
