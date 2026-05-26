# NVGT 0.9.x+ Ultra-High-Fidelity API Reference

This document provides the absolute source of truth for the NVGT engine. Gemini, you MUST reference this to ensure one-shot compilation and zero logic errors.

## Core Audio Architecture

### `class sound`
The base sound object for individual audio handles.
- `bool load(string filename, pack_interface@ pack = null)`: Loads a sound.
- `bool play()`: Starts playback.
- `bool play_looped()`: Plays the sound in a continuous loop.
- `void pause()`: Pauses the sound.
- `void stop()`: Stops playback and resets to the beginning.
- `void close()`: Closes the sound handle.
- `float volume` (property): Sound volume (0.0 to 1.0).
- `float pan` (property): Panning (-100.0 to 100.0).
- `float pitch` (property): Pitch/Playback speed (50.0 to 200.0).
- `bool active` (property): Returns true if a sound is currently loaded.
- `bool playing` (property): Returns true if the sound is playing.

### `class sound_pool`
Advanced spatial audio management for 1D, 2D, and 3D worlds.
- `int play_stationary(string filename, bool looping, bool persistent = false)`
- `int play_1d(string filename, float listener_x, float sound_x, bool looping, bool persistent = false)`
- `int play_2d(string filename, float listener_x, float listener_y, float sound_x, float sound_y, bool looping, bool persistent = false)`
- `int play_3d(string filename, float l_x, float l_y, float l_z, float s_x, float s_y, float s_z, double rotation, bool looping, bool persistent = false)`
- `void update_listener_3d(float x, float y, float z, double rotation = 0.0)`
- `void update_sound_3d(int slot, float x, float y, float z)`
- `bool destroy_sound(int slot)`
- `bool destroy_all()`

## User Interface & Forms

### `class menu`
Direct event-driven menu system.
- `void add_item(string text, string id = "")`: Adds a menu option.
- `void add_items(string[] items)`: Batch add items.
- `void intro()`: Plays the introductory speech and open sounds.
- `bool monitor()`: Must be called in the event loop. Returns `false` when the menu is closed or an item is selected.
- `int run()`: Blocking version of the menu.
- `int selected_item` (property): Returns the index of the chosen item.
- `string selected_item_id` (property): Returns the ID of the chosen item.

## Input & Logic
- `bool key_pressed(int key_code)`: Returns true if the key is currently down.
- `void wait(uint ms)`: Pauses script execution.
- `void speak(string text, bool interrupt = true)`: Standard TTS output.
- `void stop_speech()`: Immediately silences all TTS.
- `string input_box(string title, string prompt, string default_text = "")`: Synchronous text input.

## Advanced Engine Directives (AngelScript 2.3x)
- **Handles `@`**: Use for reference-counted objects (e.g., `sound@ s = sound();`).
- **Mixins**: Use `mixin class` for reusable property blocks.
- **Includes**: Use `#include "library.nvgt"` for modularity.
- **Enumerations**: Use `enum State { Menu, Game, Exit }` for state machines.
