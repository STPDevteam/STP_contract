pragma solidity ^0.4.24;
import "./MessagesAndCodes.sol";
import "./StandardCompliantToken.sol";

/// Build a class that inherist from this contract to implement your own ERCSTP token
contract MessagedERCSTP is StandardCompliantToken {
    using MessagesAndCodes for MessagesAndCodes.Data;
    MessagesAndCodes.Data internal messagesAndCodes;

    constructor () public {
        messagesAndCodes.addMessage(SUCCESS_CODE, SUCCESS_MESSAGE);
    }

    function alertOnRestrictedTransfer (uint8 code)
        public
        view
        returns (string message)
    {
        message = messagesAndCodes.messages[code];
    }
}
