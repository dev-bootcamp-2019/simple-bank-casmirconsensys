pragma solidity ^0.5.0;

contract SimpleBank {

    mapping (address => uint) private balances;

    mapping (address => bool) public enrolled;

    address public owner;

    event LogEnrolled(address accountAddress);

    event LogDepositMade(address accountAddress, uint amount );

    event LogWithdrawal(address accountAddress, uint withdrawAmount, uint newBalance);

    constructor () public {
        owner = msg.sender;

    }

    function balance() public view returns (uint) {
        return balances[msg.sender];

    }


    function enroll() public returns (bool){
        emit LogEnrolled(msg.sender);
        return enrolled[msg.sender]= true;


    }


    function deposit() payable public returns (uint) {
        balances[msg.sender] += msg.value;
        emit LogDepositMade(msg.sender, msg.value);
        return balances[msg.sender];

    }


    function withdraw(uint withdrawAmount) public returns (uint) {

        if (balances[msg.sender] >= withdrawAmount){
        balances[msg.sender]-= withdrawAmount;

        msg.sender.transfer(withdrawAmount);
        return balances[msg.sender];
        }else{
            return balances[msg.sender];
        }

    }


    function() external {

        revert();

    }
}
