pragma solidity ^0.8.7;


contract FeeCollector { 
    //Rinkeby address is "0x0738099032bD1764d493B6BbF5Cd6fB9e7Cbd6DE"
    address public owner;
    uint256 public balance;
    
    constructor() {
        owner = msg.sender; 
    }
    
    receive() payable external {
        balance += msg.value; 
    }
    
    
    function withdraw(uint amount, address payable destAddr) public {
        require(msg.sender == owner, "Only owner can withdraw");
        require(amount <= balance, "Insufficient funds");
        
        destAddr.transfer(amount);
        balance -= amount;
    }
}