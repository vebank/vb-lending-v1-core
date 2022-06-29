// SPDX-License-Identifier: BUSL-1.1
pragma solidity 0.8.10;

import {ReserveConfiguration} from '../libraries/configuration/ReserveConfiguration.sol';
import {IPoolAddressesProvider} from '../../interfaces/IPoolAddressesProvider.sol';
import {Errors} from '../libraries/helpers/Errors.sol';

//import {DataTypes} from '../libraries/types/DataTypes.sol';

import {ConfiguratorInputTypes} from '../libraries/types/ConfiguratorInputTypes.sol';

import {IPoolDataProvider} from '../../interfaces/IPoolDataProvider.sol';

/**
 * @title PoolConfigurator
 * @author Vebank
 * @dev Implements the configuration methods for the Vebank protocol
 **/
contract PoolConfiguratorInputTypes {

  using ConfiguratorInputTypes for ConfiguratorInputTypes.InitReserveInput;


  ConfiguratorInputTypes.InitReserveInput[] internal initReserveInput;
  
  struct Top {
    address aTokenImpl;
    address stableDebtTokenImpl;
    address variableDebtTokenImpl;
    uint8 underlyingAssetDecimals;
    address interestRateStrategyAddress;
    address underlyingAsset;
    address treasury;
    address incentivesController;
    

  }

  struct Remain {
    string aTokenName;  
    string aTokenSymbol;
    string variableDebtTokenName;
    string variableDebtTokenSymbol;
    string stableDebtTokenName;
    string stableDebtTokenSymbol;
  }

  Top public top;
  Remain public remain;

  function getTop() external view returns (Top memory) {
    return top;
  }

  function getRemain() external view returns (Remain memory) {
    return remain;
  }

  function getInitReserveInput() external view returns (ConfiguratorInputTypes.InitReserveInput[] memory) {
    return initReserveInput;
  }

  function createTop(address aTokenImpl, address stableDebtTokenImpl, address variableDebtTokenImpl, uint8 underlyingAssetDecimals, address interestRateStrategyAddress, address underlyingAsset, address treasury, address incentivesController) external {
    top.aTokenImpl = aTokenImpl;
    top.stableDebtTokenImpl = stableDebtTokenImpl;
    top.variableDebtTokenImpl = variableDebtTokenImpl;
    top.underlyingAssetDecimals = underlyingAssetDecimals;
    top.interestRateStrategyAddress = interestRateStrategyAddress;
    top.underlyingAsset = underlyingAsset;
    top.treasury = treasury;
    top.incentivesController = incentivesController;
  }

  function createRemain(string calldata aTokenName, string calldata aTokenSymbol, string calldata variableDebtTokenName, string calldata variableDebtTokenSymbol, string calldata stableDebtTokenName, string calldata stableDebtTokenSymbol) external {
    remain.aTokenName = aTokenName;
    remain.aTokenSymbol = aTokenSymbol;
    remain.variableDebtTokenName = variableDebtTokenName;
    remain.variableDebtTokenSymbol = variableDebtTokenSymbol;
    remain.stableDebtTokenName = stableDebtTokenName;
    remain.stableDebtTokenSymbol = stableDebtTokenSymbol;
    // remain.params = params;
  }


  function createConfiguratorInputTypes() external {
      ConfiguratorInputTypes.InitReserveInput memory data;
      data.aTokenImpl = top.aTokenImpl;
      data.stableDebtTokenImpl = top.stableDebtTokenImpl;
      data.variableDebtTokenImpl = top.variableDebtTokenImpl;
      data.underlyingAssetDecimals = top.underlyingAssetDecimals;
      data.interestRateStrategyAddress = top.interestRateStrategyAddress;
      data.underlyingAsset = top.underlyingAsset;
      data.treasury = top.treasury;
      data.incentivesController = top.incentivesController;

      data.aTokenName = remain.aTokenName;
      data.aTokenSymbol = remain.aTokenSymbol;
      data.variableDebtTokenName = remain.variableDebtTokenName;
      data.variableDebtTokenSymbol = remain.variableDebtTokenSymbol;
      data.stableDebtTokenName = remain.stableDebtTokenName;
      data.stableDebtTokenSymbol = remain.stableDebtTokenSymbol;
    //data.params = 0x0;

    initReserveInput.push(data);


  }

  function initReserves(ConfiguratorInputTypes.InitReserveInput[] calldata input)
    external {

    }

}
