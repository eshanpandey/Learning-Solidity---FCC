// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0<0.9.0;
 import "./AggregatorV3Interface.sol";

 contract FundMe{
   

     mapping(address => uint256) public addresToAmountFunded;
     address[] public funders;
     address public  owner;
     constructor() public {
    owner =msg.sender;
       }  
     function fund() public payable{
        
        
         addresToAmountFunded[msg.sender]+= msg.value;
         funders.push(msg.sender);
         // whaat eth -> to inr conversion rate 
         
     }
    //here the oracles come in i.e chain link
     function getVersion() public view returns (uint256){
         AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
         return priceFeed.version();
     }
     function getPrice() public view returns(uint256){
         AggregatorV3Interface priceFeed=AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
         (,int256 answer,,,)=priceFeed.latestRoundData();
         return uint256 (answer*1000000000);
        
     }
     function getConversionRate(uint256 ethAmount) public view returns (uint256){
         uint256 ethPrice = getPrice();
         uint256 ethAmountInUsd = (ethPrice* ethAmount);
         return ethAmountInUsd;
     
     }
     modifier onlyOwner{
         require(msg.sender==owner);//run this then
         _;// the rest of the code
     }

     function withdraw()  payable onlyOwner public{
         msg.sender.transfer(address(this).balance);
         for(uint256 funderIndex=0; funderIndex<funders.length;funderIndex++){
             address funder = funders[funderIndex];
             addresToAmountFunded[funder]=0;
         }
         funders= new address[](0);
     }
 }
