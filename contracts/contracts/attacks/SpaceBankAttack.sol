pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "../levels/SpaceBank.sol";




contract SpaceBankAttack{

    SpaceBank spaceBank;
    IERC20 spaceToken;
    constructor(address spaceBankAddress) payable {
        spaceBank = SpaceBank(spaceBankAddress);
        spaceToken = spaceBank.token();
        
    }

 
 
///Complete your attack here with extra functions
    function attack() external{
///Complete your attack here 
    }
}
