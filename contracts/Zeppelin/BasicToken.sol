pragma solidity 0.4.15;


import '../Standards/IBasicToken.sol';
import '../Math.sol';


/**
 * @title Basic token
 * @dev Basic version of StandardToken, with no allowances.
 */
contract BasicToken is IBasicToken, Math {

    ////////////////////////
    // Mutable state
    ////////////////////////

    mapping(address => uint256) internal _balances;

    uint256 internal _totalSupply;

    ////////////////////////
    // Public functions
    ////////////////////////

    /**
    * @dev transfer token for a specified address
    * @param to The address to transfer to.
    * @param value The amount to be transferred.
    */
    function transfer(address to, uint256 value)
        public
        returns (bool)
    {
        _balances[msg.sender] = sub(_balances[msg.sender], value);
        _balances[to] = add(_balances[to], value);
        Transfer(msg.sender, to, value);
        return true;
    }

    /// @dev This function makes it easy to get the total number of tokens
    /// @return The total number of tokens
    function totalSupply()
        public
        constant
        returns (uint256)
    {
        return _totalSupply;
    }

    /**
    * @dev Gets the balance of the specified address.
    * @param owner The address to query the the balance of.
    * @return An uint256 representing the amount owned by the passed address.
    */
    function balanceOf(address owner)
        public
        constant
        returns (uint256 balance)
    {
        return _balances[owner];
    }
}
