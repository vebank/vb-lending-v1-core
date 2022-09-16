// SPDX-License-Identifier: BUSL-1.1
pragma solidity 0.8.10;

import {VIP180} from '../../dependencies/openzeppelin/contracts/VIP180.sol';
import {IDelegationToken} from '../../interfaces/IDelegationToken.sol';

/**
 * @title MintableDelegationVIP180
 * @dev VIP180 minting logic with delegation
 */
contract MintableDelegationVIP180 is IDelegationToken, VIP180 {
  address public delegatee;

  constructor(
    string memory name,
    string memory symbol,
    uint8 decimals
  ) VIP180(name, symbol) {
    _setupDecimals(decimals);
  }

  /**
   * @dev Function to mint tokens
   * @param value The amount of tokens to mint.
   * @return A boolean that indicates if the operation was successful.
   */
  function mint(uint256 value) public returns (bool) {
    _mint(msg.sender, value);
    return true;
  }

  function delegate(address delegateeAddress) external override {
    delegatee = delegateeAddress;
  }
}
