const Swap = artifacts.require("Swap");
// const Web3 = require('web3');

// const web3 = new Web3(Web3.givenProvider || 'http://localhost:8545');
// console.log(web3)

module.exports = async function (deployer) {
  await deployer.deploy(Swap);

  const swapInstance = await Swap.deployed();
  console.log('Swapping ETH for DAI...')
  try {
    const amounts = await swapInstance.swap(10);
    console.log(amounts);
    if (amounts.length > 0) {
      console.log(`swapped ${amounts[0]} ETH for ${amounts[1]} DAI`)
    }
  } catch (err) {
    console.log('error while swapping');
    console.error(err)
  }
};
