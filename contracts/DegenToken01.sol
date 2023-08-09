// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";

contract DegenGamingToken is ERC20, Ownable, ERC20Burnable, Pausable {
    mapping(address => bool) private _blacklisted;

    event TokensMinted(address indexed to, uint256 value);
    event AccountBlacklisted(address indexed account);
    event AccountUnblacklisted(address indexed account);
    event RewardRedeemed(address indexed player, string itemName);

    constructor() ERC20("DegenGamingToken", "DGT") {}

    function mintTokens(address to, uint256 amount) external onlyOwner whenNotPaused {
        require(!isBlacklisted(to), "This player's account has been blacklisted due to misconduct");
        _mint(to, amount);
        emit TokensMinted(to, amount);
    }

    function rewardsStore() public pure returns (string memory) {
        return "1. Avenger warrior (value = 800 DGT)\n2. Armour shield (value = 600 DGT)\n3. poisnous arrow (value = 400 DGT)";
    }

    function redeemReward(uint256 choice) external whenNotPaused {
        require(choice <= 3, "Invalid selection");

        if (choice == 1) {
            require(balanceOf(msg.sender) >= 800, "Not enough balance");
            transfer(owner(), 800);
            emit RewardRedeemed(msg.sender, "Avengers warrior");
        } else if (choice == 2) {
            require(balanceOf(msg.sender) >= 600, "Not enough balance");
            transfer(owner(), 600);
            emit RewardRedeemed(msg.sender, "Armour shield");
        } else if (choice == 3) {
            require(balanceOf(msg.sender) >= 400, "Not enough balance");
            transfer(owner(), 400);
            emit RewardRedeemed(msg.sender, "poisnous arrow");
        }
    }

    function blacklistAccount(address account) external onlyOwner {
        _blacklisted[account] = true;
        emit AccountBlacklisted(account);
    }

    function unblacklistAccount(address account) external onlyOwner {
        _blacklisted[account] = false;
        emit AccountUnblacklisted(account);
    }

    function isBlacklisted(address account) public view returns (bool) {
        return _blacklisted[account];
    }

    function pause() external onlyOwner {
        _pause();
    }

    function unpause() external onlyOwner {
        _unpause();
    }

    function transfer(address recipient, uint256 amount) public override whenNotPaused returns (bool) {
        require(!isBlacklisted(msg.sender), "account of sender is blacklisted");
        require(!isBlacklisted(recipient), "Recipient's account is blacklisted");
        return super.transfer(recipient, amount);
    }

    function transferFrom(address sender, address recipient, uint256 amount) public override whenNotPaused returns (bool) {
        require(!isBlacklisted(sender), "account of sender is blacklisted");
        require(!isBlacklisted(recipient), "account of receipent is blacklisted");
        return super.transferFrom(sender, recipient, amount);
    }
}
