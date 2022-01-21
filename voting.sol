pragma solidity >=0.7.0 <0.9.0;

contract Voting{

    int alpha;
    int beta;

    constructor() public{
        alpha = 0;
        beta = 0;

    }

    function getTotalVotesAlpha() view public returns(int){
        return alpha;
    }

    function getTotalVotadBeta() view public returns(int){
            return beta;
    }

    function voteAlpha() public{
        alpha+=1;
    }

    function voteBeta() public{
        beta+=1;
    }
}