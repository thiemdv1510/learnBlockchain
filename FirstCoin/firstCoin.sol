// https://remix.ethereum.org/#optimize=false&runs=200&evmVersion=null&version=soljson-v0.7.5+commit.eb77ed08.js
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

contract firstCoin {
    address public minter;
    // a
    mapping (address => uint) public balances;

    event sent(address from, address to, uint amount);

    modifier onlyMinter {
        require(msg.sender == minter);
        _;
    }

    modifier checkAmount(uint amount) {
        require(amount < 1e60);
        _;
    }

    modifier checkBalance(uint amount) {
        require(amount <= balances[msg.sender], 'So du khong du');
        _;
    }

    constructor () {
        // Người gửi
        minter = msg.sender;
    }

    function mint(address receiver, uint amount) public onlyMinter checkAmount {
        balances[receiver] += amount;
    }

    function send(address receiver, uint amount) public checkBalance {
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit(msg.sender, receiver, amount);
    }
}
