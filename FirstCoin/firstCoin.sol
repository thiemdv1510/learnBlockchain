// https://remix.ethereum.org/#optimize=false&runs=200&evmVersion=null&version=soljson-v0.7.5+commit.eb77ed08.js
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

contract firstCoin {
    address public minter;
    // a
    mapping (address => uint) public balances;

    event sent(address from, address to, uint amount);

    constructor () {
        // Người gửi
        minter = msg.sender;
    }

    function mint(address receiver, uint amount) public {
        require(msg.sender == minter);
        require(amount < 1e60);
        balances[receiver] += amount;
    }

    function send(address receiver, uint amount) public {
        require(amount <= balances[msg.sender], 'Số dư không đủ');
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit(msg.sender, receiver, amount);
    }
}
