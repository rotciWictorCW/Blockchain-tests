pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./ComptrollerInterface.sol";
import "./CTokenInterface.sol";

contract LiquidityPool {
    IERC20 BRLC;
    CTokenInterface cBRLC;
    IERC20 bat;
    CTokenInterface cBat;
    ComptrollerInterface comptroller;

    constructor(
        address _BRLC,
        address _cBRLC, 
        address _bat, 
        address _cBat, 
        address _comptroller ) public{
            BRLC = _IERC20(_BRLC);
            cBRLC = CTokenInterface(_cBRLC);
            bat = IERC20(_bat);
            cBat = CTokenInterface(_cBat);
            comptroller = ComptrollerInterface(_comptroller);
        }

        function invest() external {
            BRLC.approve(address(cBRLC), 10000);
            cBRLC.mint(10000);
        }

        function casOut() external {
            uint balance = cBRLC.balanceOf(address(this));
            cBRLC.redeem(balance);
        }

        function borrow() external {
            BRLC.approve(address(cBRLC), 10000);
            cBRLC.mint(10000);

            address[] memory markets = new address[](1);
            markets[0] = address(cBRLC);
            comptroller.enterMarkets(markets);

            cBat.borrow(100);
        }

        function payback() external {
            bat.approve(address(cBat), 110);
            cBat.repayBorrow(100);
        }
}
