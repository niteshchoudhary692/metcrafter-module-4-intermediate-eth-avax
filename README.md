# DegenGamingToken (DGT) Smart Contract
DegenGamingToken (DGT) is an Ethereum-based ERC-20 token designed for gaming and rewards distribution within a decentralized gaming ecosystem. The contract implements features such as token minting, burning, blacklisting, reward redemption, and pause functionality.

### Table of Contents
Overview
Features
Usage
Token Information
Installation
License
Overview
The DegenGamingToken smart contract is built on the Ethereum blockchain and inherits functionalities from various OpenZeppelin libraries. It provides a foundation for managing tokens, rewards, and player accounts within a gaming environment. The contract allows token minting, burning, reward redemption, and account blacklisting to ensure fair and secure gaming interactions.

### Features
Minting and burning of tokens
Ownership management using Ownable contract
Token pausing and unpausing using Pausable contract
Blacklisting and unblacklisting of player accounts
Reward redemption for in-game items
### Usage
The DegenGamingToken contract provides the following functions:

mintTokens(address to, uint256 amount): Mints a specified amount of tokens and transfers them to the designated address. Only the contract owner can perform this action.

rewardsStore(): Returns a string listing available in-game reward items along with their corresponding values.

redeemReward(uint256 choice): Allows players to redeem rewards by specifying their choice. The player's balance is checked against the required balance for the chosen reward, and the corresponding amount is transferred to the contract owner.

blacklistAccount(address account): Adds an account to the blacklist, preventing it from performing certain actions within the contract. Only the contract owner can blacklist accounts.

unblacklistAccount(address account): Removes an account from the blacklist, restoring its ability to interact with the contract. Only the contract owner can unblacklist accounts.

isBlacklisted(address account): Checks whether an account is blacklisted.

pause(): Pauses contract functionality, preventing certain actions. Only the contract owner can pause the contract.

unpause(): Unpauses the contract, allowing normal operations to resume. Only the contract owner can unpause the contract.

transfer(address recipient, uint256 amount): Overrides the standard ERC-20 transfer function to ensure that neither the sender nor the recipient is blacklisted.

transferFrom(address sender, address recipient, uint256 amount): Overrides the standard ERC-20 transferFrom function to ensure that neither the sender nor the recipient is blacklisted.

Token Information
Name: DegenGamingToken
Symbol: DGT
Decimals: 18
### Installation
To deploy and interact with the DegenGamingToken smart contract, follow these steps:

Deploy the contract to the Ethereum blockchain using a development environment like Remix or Truffle.
Interact with the contract using your preferred Ethereum wallet or development tool.
### License
This project is licensed under the MIT License. See the LICENSE file for details.

