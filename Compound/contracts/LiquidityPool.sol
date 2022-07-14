pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./ComptrollerInterface.sol";
import "./CTokenInterface.sol";
import "../BRLC.json";
import {myContract} from "../BRLC-supply.js"; 

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
            BRLC = IERC20(_BRLC);
            cBRLC = CTokenInterface(_cBRLC);
            bat = IERC20(_bat);
            cBat = CTokenInterface(_cBat);
            comptroller = ComptrollerInterface(_comptroller);
        }


        function balanceOf() external {
            uint balance = cBRLC.balanceOf(address(this));
        }
}