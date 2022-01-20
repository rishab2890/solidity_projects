pragma solidity >=0.6.0 <0.9.0;

contract Will{
    address owner;
    uint    fortune;
    bool    deceased;

    constructor() payable public {
        owner = msg.sender;
        fortune = msg.value;
        deceased = false;
    }

    modifier onlyOwner{
        require(msg.sender == owner);
        _;
    }
    modifier mustBeDeceased{
        require(deceased == true);
        _;
    }
    address payable[] familyWallets;

    mapping(address => uint) inheritance;

    function setInheritance(address payable wallet, uint amount) public{
        familyWallets.push(wallet);
        inheritance[wallet] = amount;
    }

    function payout() private mustBeDeceased{
        for(uint i=0;i<familyWallets.length;i++){
            familyWallets[i].transfer(inheritance[familyWallets[i]]);
        }
    }
    function hasDeceased() public onlyOwner{
        deceased = true;
        payout();
    }

}