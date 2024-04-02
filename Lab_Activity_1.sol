// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract EtherWallet{
    address payable public owner;
    event Withdraw(uint amount);

    constructor(){
            owner = payable(msg.sender);
        }

    receive() external payable {}

    function withdraw(uint _amount) external {
        require(msg.sender == owner, "Not owner!");
        owner.transfer(_amount);
        emit Withdraw(_amount);
    }

    function getBalance() external view returns (uint){
        return (address(this).balance);
    }

}
