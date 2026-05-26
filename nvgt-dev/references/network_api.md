# NVGT Networking & Multiplayer API Master Guide

High-fidelity guide for building scalable, real-time multiplayer audio games.

## Core Networking Subsystem

### `class network`
The primary interface for peer-to-peer and client-server communication.
- `bool host(uint port, uint max_clients = 1)`: Starts hosting on a specific port.
- `bool connect(string address, uint port)`: Connects to a remote host.
- `void disconnect()`: Closes all active connections.
- `void send(string data, uint peer_id = 0, bool reliable = true)`: Sends a packet.
- `network_event@ poll()`: Non-blocking event check. MUST be called in the main loop.
- `uint active_peers` (property): Number of connected clients.

### `class network_event`
- `uint type`: Event type (`NETWORK_EVENT_CONNECT`, `NETWORK_EVENT_RECEIVE`, `NETWORK_EVENT_DISCONNECT`).
- `uint peer_id`: The sender's ID.
- `string data`: Raw packet data received.

## Advanced Data Synchronization
- **Reliable vs Unreliable**: Use `reliable = true` for logic (stats, chat) and `reliable = false` for high-frequency data (positions, velocity).
- **Serialization**: Use `string` buffers or `dict` objects translated to strings for complex data packets.

## Best Practices
1.  **Poll Rate**: Call `network.poll()` at least once per frame (every 5-10ms).
2.  **Latency Compensation**: Use `basic_character_controller` with interpolated positions to mask lag.
3.  **Security**: Sanitize all incoming `network_event.data` before parsing.
