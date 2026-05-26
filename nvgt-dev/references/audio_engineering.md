# NVGT Audio Engineering Deep-Dive

In NVGT, audio is not just sound; it's the game world. Use these techniques for maximum immersion.

## The Sound Object
Standard usage with reference handles (`@`):
```nvgt
sound@ engine = sound();
if(engine.load("sfx/engine_loop.wav")) {
    engine.loop = true;
    engine.play();
}
```

## 3D Audio & HRTF
To create a spatial world, use the `set_sound_position()` or similar 3D methods.
- **Panning**: Adjust `pan` between -100 (full left) and 100 (full right).
- **Pitch/Frequency**: Use `pitch_bend` or `frequency` for distance/speed effects (Doppler).
- **Volume/Distance**: Program a linear or logarithmic rollout for sounds as the player moves away.

## Advanced Mixing
Use the `mixer` class for professional control:
- **Buses**: Route sounds to `ui_bus`, `env_bus`, `player_bus`.
- **Effects**: Apply high-pass filters for "behind walls" or reverb for "caves".
- **Dynamic Panning**: Update sound positions in the `void main()` loop (usually every 5-10ms).

## High-Fidelity Best Practices
1.  **Avoid Clipping**: Never play multiple sounds at 100% volume simultaneously. Use a mixer to normalize.
2.  **Sample Rates**: Ensure all WAV files are 44.1kHz or 48kHz for consistency.
3.  **Latency**: Use uncompressed WAV for instantaneous SFX (shots, UI) and OGG for background streams.
4.  **HRTF**: If the user is using headphones, enable "HRTF" mode if the NVGT version supports it.
5.  **Reverb zones**: Define reverb parameters for different areas to give a sense of space.
