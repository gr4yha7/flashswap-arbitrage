pragma solidity ^0.6.6;

import './UniswapV2Library.sol';
import './interfaces/IUniswapV2Router02.sol';
import './interfaces/IUniswapV2Pair.sol';
import './interfaces/IUniswapV2Factory.sol';
import './interfaces/IERC20.sol';

contract Swap {
  IUniswapV2Router02 private uniswapRouter = IUniswapV2Router02(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);
  uint constant deadline = 1631128885;
  address private constant DAI = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
  address private constant WETH = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
  address[] path = [WETH, DAI];

  event Swapped(address indexed addr, uint sent, uint received);

  function swap(uint256 _amount) public payable returns(uint[] memory amounts) {
    IUniswapV2Factory factory = IUniswapV2Factory(uniswapRouter.factory());
    address pairAddress = factory.getPair(path[0], path[1]);
    require(pairAddress != address(0), 'This pool does not exist');
    // require(msg.value > 0, 'Zero swap value');
    // uint amountIn = msg.value;
    uint amountOut = UniswapV2Library.getAmountsOut(address(factory), _amount, path)[0];
    amounts = uniswapRouter.swapExactETHForTokens{value: _amount}(amountOut, path, msg.sender, deadline);
    emit Swapped(msg.sender, msg.value, amounts[1]);
  }
}

// IERC20 dai = IERC20(path[1]);
// dai.transfer(msg.sender, amounts[1]);