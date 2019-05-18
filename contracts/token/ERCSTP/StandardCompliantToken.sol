pragma solidity ^0.4.24;
import "./ERCSTP.sol";
import "zeppelin-solidity/contracts/token/ERC20/StandardToken.sol";


/**
 * Standard Token
 *
 */


contract StandardCompliantToken is ERCSTP, StandardToken {
    uint8 public constant SUCCESS_CODE = 0;
    string public constant SUCCESS_MESSAGE = "SUCCESS";

    modifier notRestricted (address from, address to, uint256 value) {
        uint8 restrictionCode = checkTransferValid(from, to, value);
        require(restrictionCode == SUCCESS_CODE, alertOnRestrictedTransfer(restrictionCode));
        _;
    }
    
    function checkTransferValid (address from, address to, uint256 value)
        public
        view
        returns (uint8 restrictionCode)
    {
        restrictionCode = SUCCESS_CODE;
    }
        
    function alertOnRestrictedTransfer (uint8 code)
        public
        view
        returns (string message)
    {
        if (code == SUCCESS_CODE) {
            message = SUCCESS_MESSAGE;
        }
    }
    
    function transfer (address to, uint256 value)
        public
        notRestricted(msg.sender, to, value)
        returns (bool success)
    {
        success = super.transfer(to, value);
    }

    function transferFrom (address from, address to, uint256 value)
        public
        notRestricted(from, to, value)
        returns (bool success)
    {
        success = super.transferFrom(from, to, value);
    }


}
