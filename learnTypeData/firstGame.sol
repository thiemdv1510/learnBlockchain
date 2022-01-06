// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

contract firstGame {
    // use mapping
    mapping (address => Player) public playerFind;
    // Player[] public players;
    // use enum
    enum level {Beginner, Intermadiate, Advande}
    uint countPlayer = 0;

    struct Player {
        address addressPlayer;
        string fullName;
        uint age;
        string sex;
        level myLevel;
    }

    function addPlayer(string memory fullName, uint age, string memory sex) public {
        playerFind[msg.sender] = Player(msg.sender ,fullName, age, sex, level.Beginner);
        countPlayer += 1;
    }

    function getLevelPlayer(address addressPlayer) public view returns (level) {
        return playerFind[addressPlayer].myLevel;
    }

}
