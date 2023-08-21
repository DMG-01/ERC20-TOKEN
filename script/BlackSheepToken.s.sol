//SPDX-License-Identifier:MIT
pragma solidity ^0.8.18;

import {BlackSheepToken} from "src/BlackSheepToken.sol";
import {Script} from "forge-std/Script.sol";
contract tokenDeployScript is Script {
    
    uint256 public constant INITIAL_SUPPLY = 1000 ether;

    function run() external returns(BlackSheepToken) {

        vm.startBroadcast();
        BlackSheepToken blackSheepToken = new BlackSheepToken(INITIAL_SUPPLY);
        vm.stopBroadcast();
        return blackSheepToken;
    }
    
}