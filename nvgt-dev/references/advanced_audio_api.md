# NVGT Advanced Audio Engineering Guide

Expert-level guide for immersive audio games, mixers, and dynamic soundtracks.

## Core Audio Mastering

### `class mixer`
The central hub for bus routing and effects.
- `bool add_bus(string bus_name)`: Creates a new audio bus.
- `void set_bus_volume(string bus_name, float volume)`: Adjusts bus-level gain.
- `void add_effect(string bus_name, string effect_type)`: Injects DSP (Reverb, EQ, Compression).
- `void set_effect_param(string bus_name, string param_name, float value)`: Fine-tunes DSP.

### `class soundtrack`
Manage background music with seamless transitions.
- `bool load(string filename, float volume = 1.0)`: Loads a music file for streaming.
- `void play()`: Starts playback.
- `void crossfade(string next_filename, float duration)`: Smoothly transitions to new track.
- `void pause()`: Pauses the soundtrack.
- `float volume` (property): Music volume.

### `class voice_box`
Specialized TTS management.
- `bool speak(string path, bool interrupt = true)`: Plays speech in a dedicated buffer.

## Advanced DSP & FX
- **Reverb (Environmental)**: Add a `reverb` effect to the `game_sfx` bus. Adjust `decay_time` and `room_size` for realism.
- **Low-Pass Filter (Occlusion)**: Use a `lowpass` effect to simulate sounds blocked by walls or doors.
- **Ducking (Side-chaining)**: Lower the `music` bus volume automatically when `voice_box` is active.

## Best Practices
1.  **Bus Hierarchy**: Create separate buses for `Music`, `Menu_SFX`, `UI`, and `Game_SFX`.
2.  **Resource Cleanup**: Always call `sound.close()` or `sound_pool.destroy_all()` to prevent audio memory leaks.
3.  **Streaming**: Use `soundtrack` for music to stream from disk and save precious RAM.
4.  **Effects**: Limit the number of active DSP effects on a single bus to maintain performance on lower-end CPUs.
