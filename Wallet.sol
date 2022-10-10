```contract SendEther {

      event Deposit ( address from, uint amount, uint timestamp );

      event Withdrawal ( uint amount, uint timestamp );

        

    address payable public owner;

    constructor() {

        owner = payable(msg.sender);

    }

    receive() external payable {}

      modifier onlyOwner() {

        require(msg.sender == owner, "sorry, only owner can withdraw");  

        _;

    }

// to deposit ether

    function StoreEther(uint amount) payable external{

        require(amount == msg.value, "amount not match value");

        payable(address(this)).transfer(amount);

        emit Deposit(msg.sender, msg.value, block.timestamp);

    }

// to withdraw ether

    function Withdraw(uint _amount)  external onlyOwner {

        require(_amount <= address(this).balance, "sorry, insufficient funds");

        payable(msg.sender).transfer(_amount);

        emit Withdrawal(_amount, block.timestamp);

    }

    function getBalance() external view returns (uint) {

        return address(this).balance;

    }

}```
