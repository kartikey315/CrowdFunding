// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

import "@chainlink/contracts/src/v0.8/VRFConsumerBase.sol";

contract Random is VRFConsumerBase {

    bytes32 internal keyHash;
    uint internal fee;
    uint public randomResult;

    constructor()

        VRFConsumerBase(
            0x6168499c0cFfCaCD319c818142124B7A15E857ab;
            0x01BE23585060835E02B77ef475b0Cc51aA1e0709;

        )
        {
            keyHash = 0xd89b2bf150e3b9e13446986e571fb9cab24b13cea0a43ea20a6049a85cc807cc
            fee = 0.25 * 10 ** 18;
        }

    

    function getRandomNumber() public returns (bytees32 requestId) {

        require(LINK.balanceOf(address(this)) >= fee, "Not enough LINK in contract");
        return requestRandomness(keyHash, fee);

    }

    function fulfillRandomness(bytes32 requestId, uint randomness) internal override{

        randomResult = randomness;

    }
}