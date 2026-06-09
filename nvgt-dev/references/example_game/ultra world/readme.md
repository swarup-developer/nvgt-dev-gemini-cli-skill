# Ultra World - NVGT (Nonvisual Gaming Toolkit) Online Game Reference

This directory contains the split source files of **Ultra World**, a production-grade online multiplayer audio game built using the **NVGT (Nonvisual Gaming Toolkit) 0.9.x+** engine.
It is organized into separate files matching the original directory structure to allow AI assistants to perform targeted research (using tools like grep or individual file reads) without overloading the context window.

## Core Definition: NVGT
**NVGT** stands for **Nonvisual Gaming Toolkit**. It is a modern, highly accessible audio-game engine based on AngelScript, specifically designed for creating rich audio-only and highly accessible games for visually impaired players.

## Project Structure & File Index

The game is built on a classic **Client-Server architecture** using custom network loops, structured packets, and real-time state synchronization.

### 1. Client-Side (`client/`)
- **`client/uw.nvgt`**: The main entry point of the client application. Initializes the engine settings, screen reader interfaces (such as NVDA, JAWS, SAPI), sets up keyhooks, and manages the primary startup sequences.
- **`client/includes.nvgt`**: The central script import file that compiles all client-side modules together.
- **`client/includes/`**: Deep game logic running on the client:
  - **`gameloop.nvgt`**: Drives the core game loop, processing real-time keyboard inputs, updating sound pool positions, and rendering environmental spatial audio.
  - **`net_loop.nvgt`**: The client's network message loop. Receives, decompresses (via MsgPack), and dispatches network packets from the server.
  - **`menu.nvgt` & `custom_menu.nvgt`**: Highly accessible, keyboard-navigable spoken menus supporting spatial audio orientation, speech interruptions, and custom text inputs.
  - **`map.nvgt` & `mapdata.nvgt`**: Parses grid coordinates, builds local pathfinding nodes, handles terrain collisions, and triggers ambient spatial sound layers.
  - **`inv.nvgt`**: Local inventory screen processing, allowing rapid hotkey cycling of active items, weapons, and equipable objects.

### 2. Server-Side (`server/`)
- **`server/uwserver.nvgt`**: The main entry point of the server application. Establishes socket listening on the specified port, handles database/json loading, initializes AI threads, and manages connected client slots.
- **`server/includes.nvgt`**: Compiles all server-side modules.
- **`server/includes/`**: Game authority logic:
  - **`netloop.nvgt`**: Central server network receiver, processing incoming client packets, running authority checks, and broadcasting position updates.
  - **`player.nvgt` & `player_events.nvgt`**: Tracks character persistence (stats, levels, inventory, coordinates) and authoritative game actions (combat calculations, movement validation, item pickup).
  - **`use.nvgt` & `useitem.nvgt`**: Rules engine specifying what happens when an item is consumed, placed, or equipped.
  - **`ai.nvgt`**: Server-side pathfinding, hostile mobs detection ranges, attacking routines, and movement behaviors.
  - **`commands.nvgt`**: Authoritative commands console processing (both player slash commands and administrator tools).
  - **`combine.nvgt`**: The crafting system recipe checker and generator.

## How to Query This Reference
- Use **Grep Search** to find specific implementation patterns (e.g., searching for `network_event` or `sound_pool` classes).
- Read individual files only when necessary to understand detailed logic (e.g., viewing `client/includes/net_loop.nvgt` to see packet structure).
- Do not read the entire directory at once to conserve context tokens.
