// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract SimpleStorage {
    
    
    uint256 public  favoriteNumber;
    bool favoriteBool;
    

    struct People{
        uint favoriteNumber;
        string name;
    }

    People[] public people;
    mapping(string =>uint256) public nameTofavoriteNumber;


    function store(uint256 _favoriteNumber)public {
        favoriteNumber=_favoriteNumber;
    }

    function retrieve() public view returns(uint256){
        return favoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public{
        people.push(People(_favoriteNumber, _name));
        nameTofavoriteNumber[_name]=_favoriteNumber;
    }

}