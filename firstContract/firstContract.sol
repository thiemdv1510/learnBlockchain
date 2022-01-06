pragma solidity ^0.7.5;
contract firstContract {
    uint saveData;

    function set(uint x) public {
        saveData = x;
    }

    function get() view public returns(uint x) {
        return saveData;
    }
}
