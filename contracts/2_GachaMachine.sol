// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "./1_MemeCoinGacha.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";


contract 2_GachaMachine.sol is 1_MemeCoinGacha, Pausable, AccessControl {

  bytes public constant PAUSER_ROLE = keccak256("PAUSER_ROLE");
  bytes public constant BENEFICIARY_ROLE = keccak256("BENEFICIARY_ROLE");

  address USDC;
  address DAI;

  address POLYMOON = 0xa9dfe89e216cb1f2ce160676328bfd1b759d2f3f;
  address POLYDOGE = 0x8a953cfe442c5e8855cc6c61b1293fa648bae472;
  address BIGDOGE = 0xd12e84d4506320bc0cd01d1e727fd06de73f906f;
  address POLYDOUGH = 0x474532388a5c2373dd1584beb636157a533f8dac;
  address POLYBABYDOGE = 0xdf2140dee6b07ae495382bc1cd446f7b328f63e3;
  address PIXEL = 0x94162cb84bada965e4e3f572a4429ec658dc5b70;
  address RENDOGE = 0xce829a89d4a55a63418bcc43f00145adef0edb8e;
  address WOLF = 0x8f18dc399594b451eda8c5da02d0563c0b2d0f16;
  address WOOFY = 0xd0660cd418a64a1d44e9214ad8e459324d8157f1;
  address FCAT = 0x0f4044f4475b7ec4bde170146ad02a9cd3ad4853;
  address KRILL = 0x05089c9ebffa4f0aca269e32056b1b36b37ed71b;
  address GMS = 0x0d962a1a2a27b402e4d84772dea65ac8592eb6bf;
  address SRAT = 0x1132f58810ee9ff13e97aeccd8dda688cc5eb8f4;

  address benefactor;
  address memeCoins[];

  uint i = 0;

  constuctor() {
    _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);
    _setupRole(PAUSER_ROLE, msg.sender);
    _setupRole(BENEFICIARY_ROLE, msg.sender);
  }

    }

    function useGacha(address asset) payable {
      require(msg.value == 1 USDC || msg.value == 1 DAI);
      address buyMeme = memeCoins[i];
      i++;
      if(i > memeCoins.length()) {
        i = 0;
      }
      uint howManyGMC = determineMintQuantity();
      mint(msg.sender, howManyGMC);

    }

    function setDai(address newDai)
      onlyRole(DEFAULT_ADMIN_ROLE) {
      DAI = newDai;
    }

    function set USDC(address newUSDC)
      onlyRole(DEFAULT_ADMIN_ROLE) {
      USDC = newUSDC;
    }

    function polygonMemeSetup() {
      memeCoins.push(POLYMOON);
      memeCoins.push(POLYDOGE);
      memeCoins.push(BIGDOGE);
      memeCoins.push(POLYDOUGH);
      memeCoins.push(POLYBABYDOGE);
      memeCoins.push(PIXEL);
      memeCoins.push(RENDOGE);
      memeCoins.push(WOLF);
      memeCoins.push(WOOFY);
      memeCoins.push(FCAT);
      memeCoins.push(KRILL);
      memeCoins.push(GMS);
      memeCoins.push(SRAT);
    }

}
