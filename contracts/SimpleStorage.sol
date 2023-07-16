// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// EVM: Ethereum Virtual Machine
// Avalanche, Fantom, Polygon

// contract is similar to the class in other programming languages
contract SimpleStorage {
    // This get initialized to zero!
    // <- This means that this section is a comment!
    uint256 favoriteNumber = 0;
    // bool, string, bytes32
    // uint256 public brotherNumber;
    // uint256 public sisterNumber;

    // mapping
    mapping(string => uint256) public nameToFavoriteNumber;

    // struct
    struct People {
        uint256 favoriteNumber;
        string name;
    }

    // uint256[] public favoriteNumberList;
    // array or list
    People[] public people;

    function store(uint256 _favoriteNumber) public virtual {
        favoriteNumber = _favoriteNumber;
        // favoriteNumber = favoriteNumber + 1;
        // uint256 testvar = 5;
    }

    // view, pure——read some from the contract, disallow any modification of state, you can update the blockchain at all with a view function
    // read don't cost gas, don't get a hash
    // function
    function retrieve() public view returns (uint256) {
        return favoriteNumber;
    }

    // EVM can access and store information in six places: Stack, Memory, Storage, Calldata, Code, Logs
    // calldata (can't be modified), memory (can be modified), storage (permanent variables)
    // Data location can only be specified for array, struct or mapping types
    // string (array, need to add this memory)
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        // People memory newPerson = People({favoriteNumber: _favoriteNumber, name: _name});
        People memory newPerson = People(_favoriteNumber, _name);
        people.push(newPerson);
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}
