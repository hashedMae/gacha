// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";


/**
* @dev Contract for ERC20 MemeCoinGacha that will be emitted from a gacha machine that dispenses meme coins.
* Token has no max or initial supply. Token emissions start at 100 per transaction and decrease by 90% every 3 until stablilizing at 1.
*/
contract 1_MemeCoinGacha is ERC20, Pausable, AccessControl {
    bytes32 public constant PAUSER_ROLE = keccak256("PAUSER_ROLE");
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");


    constructor() ERC20("MemeCoinGacha", "MCG") {
        _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _setupRole(PAUSER_ROLE, msg.sender);
        uint256 internal _setTime = now;
        uint256 internal _mintQuantity;
    }

    function pause() public onlyRole(PAUSER_ROLE) {
        _pause();
    }

    function unpause() public onlyRole(PAUSER_ROLE) {
        _unpause();
    }

    function mint(address to, uint256 amount)
        internal
        whenNotPaused
        onlyRole(MINTER_ROLE) {
        _mint(to, amount);
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, amount);
    }

/**
* @dev Determines amont of token to mint. Emissions start at 100, and decrease by 90% every three months until stablizing at 1.
* Token has no max supply or initial supply.
*/
    function _determineMintQuantity()
      internal
      whentNotPaused
      onlyRole(MINTER_ROLE) {
      uint256 _currentTime = now - _setTime;
      if (_currentTime < 3 months) {
        _mintQuantity = 100;
      } else if (_currentTime >= 3 months && currentTime < 6 months) {
        _mintQuantity = 10;
      } else if (_currentTime >= 6 months) {
        _mintQuantity = 1;
      }
      return _mintQuantity;
    }



}
