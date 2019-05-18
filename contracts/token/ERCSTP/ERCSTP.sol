pragma solidity ^0.4.24;
import "zeppelin-solidity/contracts/token/ERC20/ERC20.sol";

contract ERCSTP is ERC20 {
    function checkTransferValid (address from, address to, uint256 value) public view returns (uint8);

    function alertOnRestrictedTransfer (uint8 restrictionCode) public view returns (string);
}
