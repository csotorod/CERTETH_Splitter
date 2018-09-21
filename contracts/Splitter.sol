pragma solidity ^0.4.18;

contract Splitter {

    mapping (address => uint) balance;
    address owner;
    address bob;
    address carol;
    
    modifier restriccion(){
        if (msg.sender == owner)_;
    }
    
    function Splitter() {
        owner = msg.sender;
        bob = 0x583031d1113ad414f02576bd6afabfb302140225;
        carol = 0xdd870fa1b7c4700f2bd7f44238821c26f7392148;
    }
    
    event TransferEth(address uno, uint monto);
    
    function Saldo(address cuenta) constant returns(uint){
        return cuenta.balance;
    }
    
    function split() public payable returns(bool) {
        balance[bob] += msg.value / 2;
        balance[carol] += msg.value / 2;
		balance[owner] -= msg.value;
		return true;
    }
 
}
