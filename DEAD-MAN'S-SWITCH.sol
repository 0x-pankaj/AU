// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

contract Switch {

    address payable public recipient;
    address public owner;
    uint pingedTime;
    
    constructor(address payable _address) payable {
        recipient = _address;
        owner = msg.sender;
        pingedTime = block.timestamp;
    }

    function withdraw() external {
        require(block.timestamp >= pingedTime + 52 weeks);
        (bool success, )= recipient.call{value:address(this).balance}("");
        require(success);

    }

    function ping() external {
        require(msg.sender == owner,"only owner can ping");
        pingedTime = block.timestamp;
    }
    
}
