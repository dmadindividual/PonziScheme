# Investment Contract

This Solidity smart contract allows users to invest Ether and provides functionality for the chairman to withdraw the entire contract balance. The contract includes features such as event logging and a modifier to restrict specific functions to the chairman.

## Contract Overview

- **Investment Functionality**: Users can invest Ether by calling the `invest` function.

- **Withdrawal Functionality**: Investors can withdraw their returns by calling the `InvestorsWithdraw` function.

- **Contract Balance**: The `getContractBalance` function allows anyone to check the current balance of the smart contract.

- **Chairman Withdrawal**: The chairman, specified during contract deployment, can withdraw the entire contract balance using the `withdraw` function.

## Usage

1. **Deployment**: Deploy the contract on the Ethereum blockchain, and the deployer becomes the chairman.

2. **Investment**: Users can invest Ether using the `invest` function. Ensure that the investment amount is greater than 0.1 ether.

3. **Withdrawal**: Investors can withdraw their returns using the `InvestorsWithdraw` function.

4. **Chairman Withdrawal**: The chairman can withdraw the entire contract balance using the `withdraw` function.

## Prerequisites

- Solidity Compiler: [Installation Guide](https://docs.soliditylang.org/en/v0.8.13/installing-solidity.html)

## License

This smart contract is released under the MIT License. See [LICENSE](LICENSE) for details.

## Disclaimer

This smart contract is provided as-is, and users should exercise caution when deploying it on the Ethereum blockchain. The contract involves financial transactions and should be used responsibly.

