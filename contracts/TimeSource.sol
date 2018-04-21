pragma solidity 0.4.23;


contract TimeSource {

    ////////////////////////
    // Internal functions
    ////////////////////////

    function currentTime() internal constant returns (uint256) {
        return block.timestamp;
    }
}
