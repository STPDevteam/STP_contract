pragma solidity ^0.4.24;
import "./BasicTokenMock.sol";
import "../token/ERCSTP/StandardCompliantToken.sol";

contract StandardCompliantTokenMock is BasicTokenMock, StandardCompliantToken {
    constructor (address initialAccount, uint256 initialBalance)
        BasicTokenMock(initialAccount, initialBalance)
        public
    {

    }
}
