pragma solidity ^0.5.14;

contract Work4me {
    
    address public manager;
    address payable public client;
    uint public valueTask;
    bool taskOpen;
    
    modifier restricted() {
        require(msg.sender == manager);
        _;
    }

    constructor() public payable {
        manager = msg.sender;
        valueTask = msg.value;
    }
    
    function enter() public {
        require(taskOpen == false);
        client = msg.sender;
        taskOpen = true;
    }
    
    function finalizeTask() public payable restricted {
        require(taskOpen == true);
        client.transfer(valueTask);
        taskOpen = false;
    }

}