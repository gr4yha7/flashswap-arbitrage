const Arbitrage = artifacts.require("Arbitrage");

const uniFactory = '0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f';
const sushiRouter = '0xd9e1cE17f2641f24aE83637ab66a2cca9C378B9F';
const dai = '0x6B175474E89094C44Da98b954EedeAC495271d0F';
const weth = '0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2';

module.exports = async function (deployer) {
  await deployer.deploy(Arbitrage, uniFactory, sushiRouter);

  // const arbitrageInstance = await Arbitrage.deployed();
  // console.log('Starting arbitrage...')
  // try {
  //   await arbitrageInstance.startArbitrage(dai, weth, 0, 1);
  // } catch (err) {
  //   console.log('error while running arbitrage');
  //   console.error(err)
  // }
};
