# king_audio_engine — Documentation Pack

Comprehensive English & Turkish reference for the **king_audio_engine** NVGT plugin (FMOD Core + Steam Audio HRTF + embedded Opus 1.3.1).

## Files in this folder

| File | Purpose |
|------|---------|
| `king_audio_engine_EN.md` | Full API reference, English |
| `king_audio_engine_TR.md` | Tam API referansı, Türkçe |
| `examples/` | Runnable, self-contained example scripts |

## Examples

All examples ship with their dependencies (`sound_pool.nvgt`, `voice_chat.nvgt`, `step_sounds/`, IR WAVs). Each is single-file and uses only the plugin + the speech/rotation includes already in NVGT.

| Script | What it shows |
|--------|---------------|
| `01_basic_playback.nvgt`         | `sound.load` + `play_wait` |
| `02_devices.nvgt`                | Enumerating input/output devices (console) |
| `03_microphone_record.nvgt`      | `king_microphone` capture + WAV save + playback |
| `04_microphone_live_monitor.nvgt`| Live mic-in / speaker-out monitoring with gain control |
| `05_opus_encode_decode.nvgt`     | Round-trip Opus compression on captured audio |
| `06_3d_movement.nvgt`            | `sound_pool` 3D listener movement, HRTF toggle, IR convolution reverb (fixed: original test had wrong `pool.output_mixer` property name → corrected to `pool.mixer`) |
| `07_master_eq.nvgt`              | Live tweaking of `sound_master_eq_low/mid/high` |
| `08_environment_walls.nvgt`      | `sound_environment_add_wall` + occlusion ray check |
| `09_fx_chain.nvgt`               | Per-sound DSP chain with **ID prefix** for live add/remove |
| `10_voice_chat_local.nvgt`       | Mic → Opus encode → Opus decode → `push_memory` (single-machine VoIP loopback) |

## Quick install

1. Drop `king_audio_engine.dll` (and bundled FMOD/Phonon support DLLs) into your NVGT `lib/` folder.
2. Place `sound_pool.nvgt` and `voice_chat.nvgt` somewhere your scripts can `#include` them. (The `examples/` folder already contains copies for direct use.)
3. At the top of every script:

```angelscript
#pragma namespace sound upcomming
#pragma plugin king_audio_engine
```

## Where to start

- **New to the engine?** Open `king_audio_engine_EN.md` (or the TR version), read sections 1-5, then run `examples/01_basic_playback.nvgt`.
- **Want a multiplayer voice channel?** Read sections 12-15 (microphone, Opus, voice_chat) and study `examples/05_opus_encode_decode.nvgt` and `examples/10_voice_chat_local.nvgt`.
- **3D world with effects?** Sections 5-7, 14, plus `examples/06_3d_movement.nvgt` and `examples/09_fx_chain.nvgt`.
