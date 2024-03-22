# Ethernaut
 
[![Twitter Follow](https://img.shields.io/twitter/follow/OpenZeppelin?style=plastic&logo=twitter)](https://twitter.com/OpenZeppelin)
[![OpenZeppelin Forum](https://img.shields.io/badge/Ethernaut%20Forum%20-discuss-blue?style=plastic&logo=discourse)](https://forum.openzeppelin.com/tag/ethernaut)

Ethernaut is a Web3/Solidity based wargame inspired by [overthewire](https://overthewire.org), to be played in the Ethereum Virtual Machine. Each level is a smart contract that needs to be 'hacked'.

The game acts both as a tool for those interested in learning ethereum, and as a way to catalogue historical hacks as levels. There can be an infinite number of levels and the game does not require to be played in any particular order.

## SpaceBank Workshop

The objective of the workshop if to solve the SpaceBank level, learn a bit about smart contracts and solidity and for hackaton participants to familiarize themselves with the structure of an ethernaut level

For this workshop, we will focus on solving the SpaceBank challenge. You can find the challenge in contracts/contracts/levels/SpaceBank.sol. 

The formidable Space Bank is known for its stringent security systems and vast reserves of space tokens (Galactic credits). Outsmart two state-of-the-art alarms, steal the tokens, and then detonate the bank to claim victory. If the bank explodes, you win.

The SpaceBank starts with a balance of 1000 SpaceTokens.

In this workshop, we will complete the attacker contract found in contracts/contracts/attacks/SpaceBankAttack.sol and the test file in 
contracts/test/levels/SpaceBank.test.js. You should use the test file to call the SpaceBank (using the attacker contract if needed).

To run the tests first cd into the contracts folder. Thenm, install hardhat with yarn add hardhat (you need node installed). Finally run npx hardhat test.
