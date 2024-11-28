# MetaCrafters Building on Avalanche - ETH + AVAX

## Overview
This program features a Solidity contract designed for deploying decentralized applications (DApps) on both Ethereum and Avalanche networks. Built using Solidity and OpenZeppelin libraries, the contract provides functionalities for minting, burning, and transferring tokens, as well as enabling users to redeem items with those tokens. This project is a part of the MetaCrafters ETH + AVAX Proof: Intermediate EVM Course.

## Description 
Degen Token
The degenToken contract is a custom ERC20 token built using OpenZeppelin's ERC20 and Ownable contracts. This contract enables minting, burning, and transferring of tokens, as well as functionality for users to redeem items with their tokens. Each item is associated with a price, and users can redeem them by spending the required amount of tokens.

## Key Features:
- **ERC20 Token**: Implements standard ERC20 functions like minting, burning, and transferring tokens.
- **Item Redemption**: Users can redeem items by spending tokens. Items have a name, price, and availability status.
- **Item Management**: The contract owner can add new items to the system, which users can later redeem.
- **Event Emission**: The contract emits an ItemRedeemed event when an item is successfully redeemed, allowing tracking of user actions

## Installation  
### Steps to Deploy  
1. **Clone the Repository**:  
```bash
git clone https://github.com/vpquieng/types-and-functions.git
```
2. **Compile the Contract**:  
- Open the degenToken.sol file in Remix.
- Select Solidity version 0.8.26.
- Compile the contract.
3. **Deploy**:  
- Use any the inject provider (metamask) environment
- Ensure your MetaMask is installed and connected to the Avalanche Fuji testnet.
- Deploy the contract by selecting the appropriate network in Remix and confirming the deployment.
4. **Interaction**
After deployment, you can interact with the contract as follows:
- Mint Tokens: As the owner, call mintTokens with the recipient address and amount to mint new tokens.
- Transfer Tokens: Token holders can call transferTokens to send tokens to another address.
- Burn Tokens: Users can call burnTokens to burn a specified number of tokens from their own balance.
- Redeem Item: Call redeemItem with the item ID to exchange tokens for items in the catalog.
- Show Items: Call itemList to view the list of redeemable items, including their names, prices, and availability.

## Contract Details
- **Solidity Version**: `0.8.26`
- **Constructor**: Sets the deployer as the owner.


## Contributors
- **Vincent Paul Quieng** - Developer 

## License 
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
