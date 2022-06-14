//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.5.0 <0.9.0;

contract Token{

    string public name = "HardHat Token";
    string public symbol = "HHT";
    uint256 public totalsupply = 10000;
    address public owner;

    mapping(address=>uint256) balances;

    constructor() {

        balances[msg.sender] = totalsupply;
        owner = msg.sender;
    } 

    function transfer(address to, uint256 amount) external{

        require(balances[msg.sender] >= amount,"Not enough balance");
        balances[msg.sender] -= amount;
        balances[to] += amount;
    } 
    function balanceOf(address account) external view returns (uint256) {

        return balances[account];

    }
}