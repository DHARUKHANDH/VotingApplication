//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract VotingSystem{
    //Array to store candidate names
    string[5] public candidates;
    //Mapping to store the number of votes for each candidate
    mapping(string => uint256) private candidateVotes;
    //Event to notify when a vote is cast
    event VoteCast(string candidate,uint256 newVoteCount);
    //Constructor to initialize candidate names
    constructor (){
        candidates[0]="Angel";
        candidates[1]="Minion";
        candidates[2]="Doraemon";
        candidates[3]="Rock";
        candidates[4]="Sudhar";
    }

    //Function to cast a vote for a candidate
    function vote(uint256 candidateIndex)public {
        require(candidateIndex < 5,"Invalid candidate index");

        string memory selectedCandidate=candidates[candidateIndex];
        candidateVotes[selectedCandidate]++;
        emit VoteCast(selectedCandidate,candidateVotes[selectedCandidate]);
    }

    //Function to get the current vote count for a candidate
    function getVotes(string memory candidate) public view returns(uint256){
        return candidateVotes[candidate];

    }

    //Function to get all candidate names
    function getCandidateNames() public view returns  (string[5] memory){
        return candidates;
    }
}