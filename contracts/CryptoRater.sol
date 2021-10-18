// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

import "hardhat/console.sol";

contract CryptoRater {
  uint256 plusTotal;
  uint256 minusTotal;

  uint256 private seed;

  event NewRating(address indexed from, uint256 timestamp, string message);

  struct Rate {
    address rater;
    string message;
    uint256 timestamp;
  }

  Rate[] rates;

  mapping(address => uint256) public lastRateAt;

  constructor() payable {
    console.log("Summoning justsu! Smart contract!");
  }

  function plus(string memory _message) public {
    require(
      lastRateAt[msg.sender] + 10 minutes < block.timestamp,
      "Wait 15 min"
    );

    lastRateAt[msg.sender] = block.timestamp;

    plusTotal += 1;
    console.log("%s rated positively!", msg.sender);

    rates.push(Rate(msg.sender, _message, block.timestamp));

    uint256 randomNum = (block.difficulty + block.timestamp + seed) % 100;
    console.log("Random # generated: %s", randomNum);

    seed = randomNum;

    if (randomNum < 10) {
      console.log("%s won!", msg.sender);

    uint256 prizeAmount = 0.0001 ether;
    require(
      prizeAmount <= address(this).balance,
      "Gama-Chan's balance is less than the prize amount"
    );
    (bool success, ) = (msg.sender).call{value: prizeAmount}("");
    require(success, "failed to withdraw money from Gama-Chan.");
    }

    emit NewRating(msg.sender, block.timestamp, _message);
  }

  function minus(string memory _message) public {
    require(
      lastRateAt[msg.sender] + 15 seconds < block.timestamp,
      "Wait 15 min"
    );

    lastRateAt[msg.sender] = block.timestamp;

    minusTotal += 1;
    console.log("%s rated negatively!", msg.sender);
    
    rates.push(Rate(msg.sender, _message, block.timestamp));

    uint256 randomNum = (block.difficulty + block.timestamp + seed) % 100;
    console.log("Random # generated: %s", randomNum);

    seed = randomNum;

    if (randomNum < 10) {
      console.log("%s won!", msg.sender);

    uint256 prizeAmount = 0.0001 ether;
    require(
      prizeAmount <= address(this).balance,
      "Gama-Chan's balance is less than the prize amount"
    );
    (bool success, ) = (msg.sender).call{value: prizeAmount}("");
    require(success, "failed to withdraw money from Gama-Chan.");
    }

    emit NewRating(msg.sender, block.timestamp, _message);
  }

  function getAllRatings() public view returns (Rate[] memory) {
    return rates;
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