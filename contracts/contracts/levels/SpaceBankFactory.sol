pragma solidity ^0.8.0;

import './base/Level.sol';
import {SpaceBank,SpaceToken} from './SpaceBank.sol';

contract SpaceBankFactory is Level {

  function createInstance(address _player) override public payable returns (address) {
    _player;
    SpaceToken token = new SpaceToken();
    address instance = address(new SpaceBank(address(token)));
    token.mint(instance,1000);
    require(token.balanceOf(instance)==1000, "Tokens not minted");
    return instance;
  }

  function validateInstance(address payable _instance, address _player) override public view returns (bool) {
    _player;
    SpaceBank _spaceBank = SpaceBank(_instance);
    return _spaceBank.exploded();
  }
}
