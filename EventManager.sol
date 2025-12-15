// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventManager {
    address public organizer;
    uint256 public totalSeats;
    uint256 public ticketsSold;
    
    // Mapping to track if an address has already bought a ticket
    mapping(address => bool) public hasTicket;

    event TicketPurchased(address buyer, uint256 seatNumber);

    constructor() {
        organizer = msg.sender;
        totalSeats = 10; // Sets a limit of 10 seats
        ticketsSold = 0;
    }

    function buyTicket() public {
        // Check 1: Are there seats left?
        require(ticketsSold < totalSeats, "Event is Sold Out!");
        
        // Check 2: Did this person already buy one?
        require(!hasTicket[msg.sender], "You already have a ticket!");

        // Logic: Mark as sold and increase counter
        hasTicket[msg.sender] = true;
        ticketsSold++;

        emit TicketPurchased(msg.sender, ticketsSold);
    }

    // A helper to see how many seats are left
    function getSeatsLeft() public view returns (uint256) {
        return totalSeats - ticketsSold;
    }

    // Feature: The organizer can add more seats if needed
    function addSeats(uint256 _extraSeats) public {
        require(msg.sender == organizer, "Only the organizer can add seats");
        totalSeats += _extraSeats;
    }
}
