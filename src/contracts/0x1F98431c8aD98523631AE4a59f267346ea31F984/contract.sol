
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SwapFrontend is Ownable {
    using SafeERC20 for IERC20;

    address public tokenA;
    address public tokenB;

    event TokenSwapped(address indexed user, address indexed fromToken, address indexed toToken, uint256 amountIn, uint256 amountOut);
    event TokenAddressesUpdated(address newTokenA, address newTokenB);

    constructor() Ownable() {
        // Initialize with placeholder addresses
        tokenA = address(0x1111111111111111111111111111111111111111);
        tokenB = address(0x2222222222222222222222222222222222222222);
    }

    function getExchangeRate(address _fromToken, address _toToken) public view returns (uint256) {
        require(_fromToken == tokenA || _fromToken == tokenB, "Invalid fromToken");
        require(_toToken == tokenA || _toToken == tokenB, "Invalid toToken");
        require(_fromToken != _toToken, "Tokens must be different");

        // Placeholder: In a real implementation, this would fetch the actual exchange rate
        return 100; // 1 tokenA = 100 tokenB or vice versa
    }

    function estimateSwap(address _fromToken, uint256 _amountIn) public view returns (uint256) {
        address _toToken = _fromToken == tokenA ? tokenB : tokenA;
        uint256 rate = getExchangeRate(_fromToken, _toToken);
        
        if (_fromToken == tokenA) {
            return _amountIn * rate / 1e18;
        } else {
            return _amountIn * 1e18 / rate;
        }
    }

    function executeSwap(address _fromToken, uint256 _amountIn, uint256 _minAmountOut) external {
        require(_fromToken == tokenA || _fromToken == tokenB, "Invalid token");
        address _toToken = _fromToken == tokenA ? tokenB : tokenA;

        uint256 amountOut = estimateSwap(_fromToken, _amountIn);
        require(amountOut >= _minAmountOut, "Slippage too high");

        IERC20(_fromToken).safeTransferFrom(msg.sender, address(this), _amountIn);
        IERC20(_toToken).safeTransfer(msg.sender, amountOut);

        emit TokenSwapped(msg.sender, _fromToken, _toToken, _amountIn, amountOut);
    }

    function setTokenAddresses(address _newTokenA, address _newTokenB) external onlyOwner {
        require(_newTokenA != address(0) && _newTokenB != address(0), "Invalid address");
        require(_newTokenA != _newTokenB, "Addresses must be different");

        tokenA = _newTokenA;
        tokenB = _newTokenB;

        emit TokenAddressesUpdated(_newTokenA, _newTokenB);
    }
}
