# NVGT Physics, Math & Collision Guide

High-fidelity guide for 1D, 2D, and 3D movement, rotation, and spatial audio calculations.

## Core Interaction Logic

### `class basic_character_controller`
Simplifies character movement in complex worlds.
- `bool update_position(float x, float y, float z)`: Manages the internal coordinates.
- `bool check_collision(float next_x, float next_y, float next_z)`: Virtual method for wall detection.
- `float x, y, z` (properties): Current position.
- `double theta, delta` (properties): Horizontal and vertical orientation.

### `class rotation`
Manages orientation math for spatial audio.
- `double calculate_theta(float x1, float y1, float x2, float y2)`: Returns the angle between two points.
- `void rotate_point(float &inout x, float &inout y, double angle)`: Rotates a 2D point based on degree.

### `class vector`
Standard 3D vector math (if used via `#include`).
- `float length()`: Returns the magnitude.
- `vector@ normalize()`: Returns a unit vector.
- `float dot(vector@ other)`: Dot product.

## Advanced Spatial Logic
- **Doppler Effect**: Calculate relative velocity between listener and source.
- **Occlusion**: Use `db_props` to store map collision data and lower volume/apply lowpass filter when blocked.
- **Elevation (Delta)**: Use `sound_pool.play_3d` with delta values to simulate sounds above or below.

## Best Practices
1.  **Framerate Independence**: Use `timer` objects and `delta_time = timer.elapsed / 1000.0` for movement logic.
2.  **Angle Wrapping**: Always ensure theta is within 0-360 degrees if performing manual math.
3.  **Optimization**: Only use `sound_pool.update_3d` on slots that have actually moved.
4.  **Collision**: Call collision checks *before* updating the final x, y, z properties.
