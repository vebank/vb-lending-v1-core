// SPDX-License-Identifier: BUSL-1.1
pragma solidity 0.8.10;

import {IVIP180} from '../../../dependencies/openzeppelin/contracts/IVIP180.sol';
import {DataTypes} from '../types/DataTypes.sol';

/**
 * @title Helpers library
 * @author VeBank
 */
library Helpers {
  /**
   * @notice Fetches the user current stable and variable debt balances
   * @param user The user address
   * @param reserveCache The reserve cache data object
   * @return The stable debt balance
   * @return The variable debt balance
   **/
  function getUserCurrentDebt(address user, DataTypes.ReserveCache memory reserveCache)
    internal
    view
    returns (uint256, uint256)
  {
    return (
      IVIP180(reserveCache.stableDebtTokenAddress).balanceOf(user),
      IVIP180(reserveCache.variableDebtTokenAddress).balanceOf(user)
    );
  }
}
