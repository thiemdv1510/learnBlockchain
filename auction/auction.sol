// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

contract simpleAuction {
    address public highestBidder;

    event highestBidIncrease(address bigger, uint amount);
    event auctionEnded(address winner, uint amount);

    constructor (uint _biddingTime, address payable _beneficiary) {
        beneficiary = _beneficiary;
        auctionEndTime = block.timestamp + _biddingTime;
    }

    function bid() public payable {
        if (block.timestamp < auctionEndTime) {
            revert("Phiên đấu giá đã kết thúc");
        }

        if (msg.value <= highestBid) {
            revert("Giá của bạn thấp hơn giá cao nhất");
        }

        if (highestBid != 0) {
            pendingReturn[highestBidder] += highestBid;
        }

        highestBidder = msg.sender;
        highestBid = msg.value;
        emit highestBidIncrease(msg.sender, msg.value);
    }

    function withdraw() public {
        uint amount = pendingReturn[msg.sender];
        if (amount > 0) {
            pendingReturn[msg.sender] = amount;
            return false;
        }

        return true;
    }

    function auctionEnd() public {
        if (ended) {
            revert("Phiên đấu giá đã có thể kết thúc");
        }

        if (block.timestamp < auctionEndTime) {
            revert("Phiên đấu giá chưa kết thúc");
        }
    }
}
