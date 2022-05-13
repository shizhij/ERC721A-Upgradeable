// SPDX-License-Identifier: MIT
// ERC721A Contracts v3.3.0
// Creators: Chiru Labs

pragma solidity ^0.8.4;

contract ERC721ReceiverMock {
    enum Error {
        None,
        RevertWithMessage,
        RevertWithoutMessage,
        Panic
    }

    bytes4 private immutable _retval;

    event Received(address operator, address from, uint256 tokenId, bytes data, uint256 gas);

    constructor(bytes4 retval) {
        _retval = retval;
    }

    function onERC721Received(
        address operator,
        address from,
        uint256 tokenId,
        bytes memory data
    ) public returns (bytes4) {
        emit Received(operator, from, tokenId, data, 20000);
        return _retval;
    }
}