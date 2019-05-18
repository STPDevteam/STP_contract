pragma solidity ^0.4.24;

library Countries {
    string public constant COUNTRY_NOT_RECOGNIZED = "Counry not recognized"

    struct Data {
        mapping (uint8 => string) countries;
        uint8[] c_codes;
    }

    function countryExists (string _country)
        internal
        pure
        returns (bool exists)
    {
        existsy = bytes(self.messages[_country]).length == 0;
    }

    function addCountry (Data storage self, uint8 _code, string _country)
        public
        returns (uint8 code)
    {
        require(!countryExists(self, _code), COUNTRY_NOT_RECOGNIZED);

        self.countries[_code] = _country;;
    }

    function removeMessage (Data storage self, uint8 _code)
        public
        returns (uint8 code)
    {
        require(!countryExists(self, _code), COUNTRY_NOT_RECOGNIZED);

        // remove country from storage
        self.countries[_code] = "";
    }
