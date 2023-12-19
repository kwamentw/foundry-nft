//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {BasicNft} from "../src/BasicNft.sol";

contract MintBasicNFT is Script{
    string public constant PUG = "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("BasicNft",block.chainid);
        mintNftOnContract(mostRecentlyDeployed); 

        }

    function mintNftOnContract(address ContractAddress) public {
        vm.startBroadcast();
        BasicNft(ContractAddress).mintNft(PUG);
        vm.stopBroadcast();
    }
}