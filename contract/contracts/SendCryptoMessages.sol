// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract SendCryptoMessages {
    uint256 messagesCount;

    event Transfer(address from, address receiver, uint amount, string message, uint256 timestamp, string keyword);

    struct MessageStruct {
        address sender;
        address receiver;
        uint amount;
        string message;
        uint256 timestamp;
        string keyword;
    }

    MessageStruct[] messages;

    function addToBlockchain(address payable receiver, uint amount, string memory message, string memory keyword) public {
        messagesCount += 1;
        messages.push(MessageStruct(msg.sender, receiver, amount, message, block.timestamp, keyword));

        emit Transfer(msg.sender, receiver, amount, message, block.timestamp, keyword);
    }

    function getAllMessages() public view returns (MessageStruct[] memory) {
        return messages;
    }

    function getMessagesCount() public view returns (uint256) {
        return messagesCount;
    }
}
