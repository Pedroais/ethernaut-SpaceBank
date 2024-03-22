pragma solidity ^0.8.9;
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

interface IFlashLoanReceiver {
    function executeFlashLoan(uint256 amount) external;
}
///@author Pedro Aisenson
contract SpaceBank {

    //Token of the bank
    IERC20 public token;
    //Depositor balances
    mapping(address => uint256) public balances;
    //reentrancy protection
    bool entered;


    uint256 alarmTime;

    bool public exploded;


    modifier _emergencyAlarms(uint256 number){
        if(entered=true){
        _emergencyAlarmProtocol(number);
        }
        _;
    }


    constructor(address _token) {
        token = IERC20(_token);
    }   
    
    //Deposit into the bank
    function deposit(uint256 amount,uint256 number) external _emergencyAlarms(number) {
        require(token.transferFrom(msg.sender, address(this), amount), "Transfer failed");
        balances[msg.sender] += amount;
        
    }

    //Withdraws from the bank
    function withdraw(uint256 amount) external {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        require(token.transfer(msg.sender, amount), "Transfer failed");
    }
 

    //Takes a flashloan from the bank
    function flashLoan(uint256 amount, address flashLoanReceiver) external {
        
        uint256 initialBalance = token.balanceOf(address(this));

        require(initialBalance >= amount, "Not enough liquidity");
        // Transfer loan amount to the receiver
        require(token.transfer(flashLoanReceiver, amount), "Transfer failed");
        
        // Execute custom logic in the receiver's contract
        entered = true;

        (bool success, bytes memory result) = flashLoanReceiver.call(abi.encodeWithSignature("executeFlashLoan(uint256)",amount));
        if (success == false)revert(string(result));
        entered = false;
        uint256 fee = amount / 1000; // 0.1% fee
        uint256 currentBalance = token.balanceOf(address(this));
        require(currentBalance >= initialBalance + fee, "Loan not repaid with fee");
    }


    //Alarms will be activated to protect from thiefs
    function _emergencyAlarmProtocol(uint256 number)internal{
       
        require(number==block.number%47,"Wrong passphrase"); 
                     //second alarm  
        alarmTime = block.number;


        

        
    
    }


    ///Make the bank explode 
    function explodeSpaceBank() external { 
        require (block.number == alarmTime+2,"Can't explode the bank");         
        require(token.balanceOf(address(this))==0,"The bank still has funds");
        exploded = true; 
    }

 


}

contract SpaceToken is ERC20, Ownable {
    constructor() ERC20("SpaceToken", "Space") {}

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}
