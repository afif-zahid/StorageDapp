// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DecentralizedStorage {
    struct File {
        string ipfsHash;
        address owner;
    }

    File[] public files;
    mapping(address => uint[]) public userFiles;

    event FileStored(uint indexed fileId, string ipfsHash, address owner);

    function storeFile(string memory _ipfsHash) public {
        files.push(File(_ipfsHash, msg.sender));
        userFiles[msg.sender].push(files.length - 1);
        emit FileStored(files.length - 1, _ipfsHash, msg.sender);
    }

    function getFiles() public view returns (string[] memory) {
        string[] memory userFileHashes = new string[](userFiles[msg.sender].length);
        for (uint i = 0; i < userFiles[msg.sender].length; i++) {
            userFileHashes[i] = files[userFiles[msg.sender][i]].ipfsHash;
        }
        return userFileHashes;
    }
}
