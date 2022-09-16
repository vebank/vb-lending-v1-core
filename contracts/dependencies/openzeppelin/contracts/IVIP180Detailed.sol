// SPDX-License-Identifier: agpl-3.0
pragma solidity 0.8.10;

import {IVIP180} from './IVIP180.sol';

interface IVIP180Detailed is IVIP180 {
  function name() external view returns (string memory);

  function symbol() external view returns (string memory);

  function decimals() external view returns (uint8);
}
