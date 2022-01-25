pragma solidity^0.8.7;

// SPDX-License-Identifier: MIT
// Created by Synthetic DAO

contract DataViz {
    address owner;

    string public standard = "DataViz";
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;
    uint256 public initialSupply = 0.019 ether;

    constructor() {
        totalSupply = 8888;
    }
}
