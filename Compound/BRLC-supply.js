/**
 * Executes our contract's `supplyErc20ToCompound` function
 *
 * ## run the localhost fork and deploy script prior to this one
 * npx hardhat run scripts/deploy.js --network localhost
 *
 */
require("dotenv").config();
const ethers = require("ethers");
const provider = new ethers.providers.JsonRpcProvider('https://rpc.testnet.cloudwalk.io/');


// Set up a wallet using one of Ganache's key pairs.
// Don't use this key outside of your local test environment.
const privateKey = "a32bf07df68bfc5267252a4f891ec23c23430b1393c4176794f0ebc42a72627c";

const wallet = new ethers.Wallet(privateKey, provider);
const myWalletAddress = wallet.address;

// `myContractAddress` is logged when running the deploy script.
// Run the deploy script prior to running this one.
const myContractAddress = "0xC6d1eFd908ef6B69dA0749600F553923C465c812";
const BRLC =
  require("./BRLC.json");
const myContract = new ethers.Contract(myContractAddress, BRLC, wallet);

const contract1 = async () => {
  const contractOwner = await myContract.decimals();
  console.log(contractOwner);
};

contract1()