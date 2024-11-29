// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.8.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.8.0/contracts/access/Ownable.sol";

contract degenToken is ERC20, Ownable {
    struct Item {
        string name;
        uint price;
        bool available;
    }
    mapping(uint => Item) public items;
    mapping(address => uint[]) public redeemedItems;
    uint public itemCount;

    event ItemRedeemed(address indexed user, uint indexed itemId, string itemName, uint price);

    constructor() ERC20("Degen", "DGN") {
        itemCount = 0;
        addItem("DGN Black Sword", 80);
        addItem("DGN Metallic Shield", 30);
        addItem("DGN Pendant", 50);
    }

    function mintTokens(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    function burnTokens(uint256 amount) public {
        require(balanceOf(msg.sender) >= amount, "There is not enough tokens to burn");
        _burn(msg.sender, amount);
    }

    function getBalanceToken() external view returns (uint256) {
        return this.balanceOf(msg.sender);
    }

    function transferTokens(address to, uint256 amount) external {
        require(balanceOf(msg.sender) >= amount, "There not enough tokens to transfer");
        approve(msg.sender, amount);
        transferFrom(msg.sender, to, amount);
    }

    function addItem(string memory name, uint price) internal {
        items[itemCount] = Item(name, price, true);
        itemCount++;
    }

    function redeemItem(uint256 itemId) public {
        require(itemId < itemCount, "The item does not exist");
        Item storage item = items[itemId];
        require(item.available, "This item is not available for redemption");
        require(balanceOf(msg.sender) >= item.price, "Your balance is insufficient to redeem this item");
        _burn(msg.sender, item.price);
        item.available = false;
        redeemedItems[msg.sender].push(itemId);
        emit ItemRedeemed(msg.sender, itemId, item.name, item.price);
    }

    function getRedeemedItems(address user) public view returns (uint256[] memory) {
    return redeemedItems[user];
}

    function itemList() public view returns (string[] memory, uint[] memory, bool[] memory) {
        string[] memory itemNames = new string[](itemCount);
        uint[] memory itemPrices = new uint[](itemCount);
        bool[] memory itemAvalable = new bool[](itemCount);
        for (uint256 i = 0; i < itemCount; i++) {
            itemNames[i] = items[i].name;
            itemPrices[i] = items[i].price;
            itemAvalable[i] = items[i].available;
        }
        return (itemNames, itemPrices, itemAvalable);
    }
}
