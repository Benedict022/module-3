// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Alcantara is ERC20 {
    address public owner;

    constructor(address _owner) ERC20("BurgerMc", "Bm") {
        require(_owner != address(0), "Owner address cannot be the zero address");
        owner = _owner;
    }

    function mint(acaddress count, uint256 amount) public {
        require(msg.sender == owner, "Only the owner can use this mint function");
        _mint(account, amount);
    }

    function burn(uint256 amount) public {
          require(amount > 0, "Burn amount must be greater than zero");
        _burn(msg.sender, amount);
    }

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        require(amount > 0, "Transfer amount must be greater than zero");
        return super.transfer(recipient, amount);
    }
}