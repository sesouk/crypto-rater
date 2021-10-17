// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

import "hardhat/console.sol";

contract CryptoRater {
  uint256 plusTotal;
  uint256 minusTotal;

  constructor() {
    console.log("Summoning justsu! Smart contract!");
  }

  function plus() public {
    plusTotal += 1;
    console.log("%s rated positively!", msg.sender);
  }

  function minus() public {
    minusTotal += 1;
    console.log("%s rated negatively!", msg.sender);
  }

  function getPlus() public view returns (uint256) {
    console.log("Positive rating of %d :)", plusTotal);
    return plusTotal;
  }

  function getMinus() public view returns (uint256) {
    console.log("Negative rating of %d :(", plusTotal);
    return minusTotal;
  }
}