# Decentralized Event Ticketing System

**Author:** [AbdulBasith Mulla]
**Tech Stack:** Solidity (v0.8+), Ethereum, Remix IDE

## Project Overview
This project is a blockchain-based event registration system designed to eliminate ticket scalping and double-booking. Built with Solidity, the smart contract manages seat availability in real-time and ensures a transparent, immutable record of all ticket sales.

## Key Features
* **Double-Booking Prevention:** Utilizes a `mapping(address => bool)` to ensure each wallet address can purchase only one ticket.
* **Dynamic Capacity Management:** Includes administrative functions allowing the organizer to increase seat limits post-deployment.
* **Real-Time Availability:** Public view functions allow users to query the exact number of remaining seats instantly.
* **Secure Access Control:** Restricted functions (like adding seats) are protected by `require` statements ensuring only the organizer can execute them.

## Smart Contract Logic
The core logic revolves around the `EventManager` contract which handles:
1.  **State Management:** Tracks `totalSeats` and `ticketsSold`.
2.  **Event Emission:** Emits a `TicketPurchased` event whenever a transaction is successful, enabling frontend applications to react to updates.
3.  **Validation:** Enforces strict checks for sold-out conditions and duplicate entries before processing a transaction.

## How to Run
1.  Clone this repository or copy the `EventManager.sol` code.
2.  Open **[Remix IDE](https://remix.ethereum.org/)**.
3.  Compile the contract using Solidity compiler **0.8.0** or higher.
4.  Deploy the contract using **Injected Provider - MetaMask** (Sepolia Testnet or Ganache).
5.  Interact with the deployed contract to `buyTicket` or `checkAvailability`.

---
*This project was developed as part of the Blockchain Technology laboratory coursework.*
