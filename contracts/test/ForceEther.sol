pragma solidity 0.4.23;


contract ForceEther {

    ////////////////////////
    // Constructor
    ////////////////////////

    function ForceEther()
        payable
        public
    {}

    ////////////////////////
    // Public functions
    ////////////////////////

    function pay(address target)  public {
        // On selfdestruct ether is transfered without
        // involving the callback function.
        selfdestruct(target);
    }
}
