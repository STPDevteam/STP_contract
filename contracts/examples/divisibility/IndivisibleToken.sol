pragma solidity ^0.4.24;
import "../../token/ERCSTP/MessagedERCSTP.sol";

contract IndivisibleToken is MessagedERCSTP {
    uint8 public decimals;
    uint8 public FRACTION_TRANSFER_CODE;
    string public constant FRACTION_TRANSFER_ERROR = "ILLEGAL_TRANSFER_VALUE_CANNOT_BE_A_FRACTION";

    constructor (uint8 _decimals) {
        decimals = _decimals;
        FRACTION_TRANSFER_CODE = messagesAndCodes.autoAddMessage(FRACTION_TRANSFER_ERROR);
    }

    function isWholeValue (uint256 value) internal view returns (bool) {
        uint256 baseUnit = 10 ** uint256(decimals);
        return value % baseUnit == 0;
    }

    function checkTransferValid (address from, address to, uint256 value)
        public
        view
        returns (uint8 restrictionCode)
    {
        restrictionCode = SUCCESS_CODE;
        if (!isWholeValue(value)) {
            restrictionCode = FRACTION_TRANSFER_CODE;
        }
    }
}