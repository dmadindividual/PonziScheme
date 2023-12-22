// SPDX-License-Identifier: MIT
// The SPDX-License-Identifier is a way to declare the license under which the smart contract is released.

pragma solidity ^0.8.13;

contract InvestmentContract {
    // Address of the chairman who has special privileges.
    address Chairman;
    
    // Event triggered when an investor makes a new investment.
    event Investment(address indexed investor, uint256 amount);
    
    // Event triggered when an investor withdraws their returns.
    event Withdrawal(address indexed investor, uint256 amount);
    
    // Mapping to store the invested amount for each investor.
    mapping(address => uint) public Investors;

    // Constructor function that initializes the chairman as the contract deployer.
    constructor() payable {
        Chairman = msg.sender;
    }

    // Modifier to restrict access to specific functions to the chairman.
    modifier OnlyChairman() {
        require(Chairman == msg.sender, "You are not the Chairman");
        _;
    }

    // Function to allow users to invest Ether.
    function invest() public payable {
        // Ensure the invested amount is more than 0.1 ether.
        require(msg.value > 0, "Please invest more than 1 ether");
        
        // Update the invested amount for the investor.
        Investors[msg.sender] += msg.value;
        
        // Trigger an Investment event.
        emit Investment(msg.sender, msg.value);
    }

    // Function to allow investors to withdraw their returns.
    function InvestorsWithdraw() external {
        // Get the invested amount for the caller.
        uint investedAmount = Investors[msg.sender];
        
        // Ensure the investor has an investment.
        require(investedAmount > 0, "You didn't invest");
        
        // Calculate the withdrawal amount (130% of the invested amount).
        uint withdrawalAmount = (investedAmount * 130) / 100;
        
        // Reset the investor's investment to 0.
        Investors[msg.sender] = 0;
        
        // Transfer the withdrawal amount to the investor.
        payable(msg.sender).transfer(withdrawalAmount);
        
        // Trigger a Withdrawal event.
        emit Withdrawal(msg.sender, withdrawalAmount);
    }

    // Function to get the current balance of the smart contract.
    function getContractBalance() external view returns (uint256) {
        return address(this).balance;
    }

    // Function to allow the chairman to withdraw the entire contract balance.
    function withdraw() external OnlyChairman {
        // Get the current balance of the smart contract.
        uint contractBalance = address(this).balance;
        
        // Ensure there are funds to withdraw.
        require(contractBalance > 0, "No funds to withdraw");
        
        // Transfer the entire contract balance to the chairman.
        payable(Chairman).transfer(contractBalance);
    }
}
