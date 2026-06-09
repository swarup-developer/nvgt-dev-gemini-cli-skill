# King Audio Engine — Complete Usage Guide (English)

NVGT plugin built on **FMOD Core API** + **Steam Audio (Phonon)** HRTF + embedded **Opus 1.3.1** codec. Replaces MiniAudio with higher-quality 3D positioning, professional DSP effects, microphone capture, and VoIP-ready compression.

---

## 1. Installation

1. Drop `king_audio_engine.dll` (and the FMOD/Phonon support DLLs that ship with it) into your NVGT `lib/` folder (or any folder NVGT loads plugins from).
2. Place the helper scripts `sound_pool.nvgt` and `voice_chat.nvgt` (from `king_audio_engine/includes/`) somewhere your script can `#include` them.
3. At the top of every script that uses the engine, add:

```angelscript
#pragma namespace sound upcoming
#pragma plugin king_audio_engine
```

The `upcoming` namespace tells NVGT to use the king_audio engine's sound class instead of the built-in one.

---

## 2. Coordinate System & Rotation

| Axis | NVGT (your script) | FMOD (internal) |
|------|-------------------|-----------------|
| X    | left/right        | left/right      |
| Y    | depth / forward   | up              |
| Z    | up / height       | depth / forward |

The engine swaps Y/Z internally — **always pass NVGT coordinates**, never pre-converted.

- Rotation is in **DEGREES**, never radians. Do **not** wrap with `calculate_theta()`.
- 0° faces forward (+Y), 90° faces right (+X), 180° behind, 270° left.

---

## 3. Hello World

```angelscript
#pragma namespace sound upcoming
#pragma plugin king_audio_engine

void main() {
    sound s;
    s.load("hello.ogg");
    s.play_wait();          // blocks until done
}
```

3D positioned playback:

```angelscript
sound s;
s.load("door.ogg");
set_listener(player_x, player_y, player_z, player_rotation);   // global listener
s.set_position(player_x, player_y, player_z, 10, 5, 0, player_rotation);
s.play();
king_system_update();       // call ONCE per frame, after all sound updates
```

---

## 4. Global Functions & Properties

| Symbol | Description |
|--------|-------------|
| `bool SOUND_AVAILABLE` | Engine initialised correctly |
| `float sound_master_volume` | Master output **0–100** linear (0 silent, 100 normal, 200 max would be allowed but clamped to 100) |
| `set_listener(float x, float y, float z, float rotation_deg)` | Set the global FMOD listener position once per frame |
| `king_system_update()` | Flushes FMOD state — **call once per frame** at the very end |
| `float listener_x / listener_y / listener_z / listener_rotation` | Read current listener |
| `bool king_global_hrtf` | Toggle HRTF for every newly created sound. Default `false`. |
| `bool king_realistic_distance` | Use realistic distance attenuation curve |
| `void sound_master_eq(float low, float mid, float high)` | 3-band master EQ in dB. Crossovers fixed: 250 Hz / 4000 Hz |
| `float sound_master_eq_low / mid / high` | Read or write each band individually (dB) |
| `uint sound_output_device` | Index of currently selected output (read/write) |
| `string[]@ sound_output_devices` | Names of all available output devices |
| `uint sound_input_device` | Index of currently selected microphone |
| `string[]@ sound_input_devices` | Names of all available microphones |
| `set_default_pack(king_pack@)` / `set_default_pack(king_virtual_pack@)` | All future loads with a relative filename look here first |

---

## 5. The `sound` Class

### 5.1 Loading

```angelscript
bool load(const string &in filename, king_pack@ pack = null);
bool load(const string &in filename, king_virtual_pack@ pack);
bool load_url(const string &in url);
bool stream(const string &in filename, king_pack@ pack = null);
bool load_samples(array<int16>@ samples, int sample_rate = 44100, int channels = 1);
bool load_pcm(const string &in data, int sample_rate = 44100, int channels = 1);
bool push_memory(const string &in data, bool end_stream = false, int pcm_rate = 0, int pcm_channels = 0);
bool close();
```

Supported formats: WAV, OGG, MP3, FLAC, plus any raw PCM you push yourself.

### 5.2 Playback

```angelscript
bool play(bool reset_loop_state = true);
bool play_wait();        // blocks until end
bool play_looped();
bool pause();
bool stop();
bool seek(float position_ms);
```

### 5.3 State (read-only properties)

```angelscript
bool   active;            // sound is loaded and ready
bool   playing;
bool   paused;
bool   sliding, pan_sliding, pitch_sliding, volume_sliding;
float  length;            // milliseconds
float  position;          // milliseconds
const string loaded_filename;
double pitch_lower_limit; // engine-defined floor
```

### 5.4 Volume / Pitch / Pan

```angelscript
float pitch  = 100.0;     // 100 = original speed, 50 = half, 200 = double
float pan    = 0.0;       // -100 = full left, 0 = center, 100 = full right
float volume = 0.0;       // -100 dB (silent) … 0 dB (full). LEGACY dB SCALE
```

> **Important.** `set_volume()` does **not** push the value straight into FMOD. The engine combines `base_volume_db` with the distance-based attenuation inside `set_position()`. This intentionally prevents the user-set volume from fighting the spatial attenuation. To make a per-sound change audible without the listener moving, simply call `set_position()` again after assigning a new volume.

Smooth transitions:

```angelscript
bool slide_pitch(float target,  uint duration_ms);
bool slide_pan(float target,    uint duration_ms);
bool slide_volume(float target_db, uint duration_ms);
```

### 5.5 3D Positioning

```angelscript
bool set_position(float lx, float ly, float lz,
                  float sx, float sy, float sz,
                  float rotation_deg = 0,
                  float pan_step     = 1,
                  float volume_step  = 1);

void set_hrtf(bool enable = true);
```

`pan_step` and `volume_step` are multipliers for the BGT-style stepping behaviour (1.0 = original sensitivity).

### 5.6 Mixer Routing

```angelscript
bool set_mixer(mixer@ m = null);   // null = back to master
```

### 5.7 Per-sound DSP

```angelscript
int set_fx(const string &in fx, int index = -1);
```

- `index = -1` → append a new effect.
- `index >= 0` → replace the existing effect at that slot.
- Pass an empty string to delete: `s.set_fx("", 0);`
- Effects can also be addressed by **ID**: prefix with `$id:` to assign or update by name. `s.set_fx("$amp:fader:-6")` adds (or updates if it already exists) a fader DSP tagged "amp" at -6 dB. Sending only the ID (`s.set_fx("$amp")`) removes it.

> **Critical pitfall.** `set_fx()` MUST be called **after `load()`** and **before `play()`**. `load()` rebuilds the channel and destroys any DSP attached earlier.

---

## 6. The `mixer` Class

A `mixer` is an FMOD ChannelGroup. Use it to bus sounds together for shared reverb, EQ, volume, pitch — or to nest groups inside groups.

```angelscript
mixer dialog;
dialog.set_volume(-6);
dialog.set_reverb_preset("room");

sound npc;  npc.load("npc01.ogg");  npc.set_mixer(dialog);  npc.play();
```

### 6.1 Routing

```angelscript
bool set_mixer(mixer@ parent = null);   // route THIS mixer into another
bool add_mixer(mixer@ child);
bool remove_mixer(mixer@ child);
bool add_sound(sound@);
bool remove_sound(sound@);
```

### 6.2 Reverb

#### Custom reverb

```angelscript
bool set_reverb(float decay_ms,
                float wet_db        = 0,
                float dry_db        = -80,
                float diffusion     = 80,
                float density       = 60,
                float early_delay   = 5,
                float late_delay    = 10,
                float hf_reference  = 5000,
                float hf_decay_ratio= 50,
                float low_shelf_freq= 250,
                float low_shelf_gain= 0,
                float high_cut      = 8000,
                float early_late_mix= 60);
```

#### Presets (`set_reverb_preset(name, wet_db = 0, dry_db = -80)`)

| Preset       | Description                |
|--------------|----------------------------|
| `room`       | Small dry room             |
| `hall`       | Concert hall               |
| `cave`       | Deep cave                  |
| `bathroom`   | Tiled bathroom             |
| `arena`      | Sports arena               |
| `hangar`     | Empty aircraft hangar      |
| `forest`     | Sparse outdoor reflections |
| `tunnel`     | Long underground tunnel    |
| `underwater` | Muffled underwater         |

```angelscript
mixer m;
m.set_reverb_preset("hangar", -3, -80);   // wet -3 dB, dry full off
```

`m.remove_reverb()` to clear.

#### Convolution reverb (impulse response)

```angelscript
bool set_convolution(const string &in wav_filename, float wet = 0, float dry = 0, bool linked = false);
bool set_convolution(const string &in wav_filename, king_pack@ pack, float wet = 0, float dry = 0, bool linked = false);
```

WAV must be PCM (16/24/32-bit). `linked = true` shares processing across stereo channels (cheaper, less stereo separation).

> Known limitation: convolution can crash on certain IR data layouts; test before shipping.

### 6.3 Mixer DSP / HRTF / Position

```angelscript
int  set_fx(const string &in fx, int index = -1);
void set_hrtf(bool enable = true);
bool set_position(float lx, float ly, float lz, float sx, float sy, float sz, float rotation_deg);
```

Same volume/pitch/pan/slide API as `sound`.

---

## 7. FX (DSP) Reference

Format: `set_fx("name:p1:p2:p3...")` — colon separated. Optional ID prefix: `$myname:name:params`.

### 7.1 Reverb family

| Effect     | Parameters (in order)                                                                                                                    |
|------------|------------------------------------------------------------------------------------------------------------------------------------------|
| `reverb`   | decay_ms, early_delay_ms, late_delay_ms, hf_ref_hz, hf_decay_ratio, diffusion, density, lowshelf_freq, lowshelf_gain_db, highcut_hz, early_late_mix, wet_db, dry_db |
| `freeverb` | dry_mix(0–1), wet_mix(0–1), roomsize(0–1), damp(0–1), width(0–1) — legacy BASS-style, mapped to SFX reverb internally                     |

### 7.2 Echo / delay

| Effect    | Parameters                                                       |
|-----------|------------------------------------------------------------------|
| `echo`    | delay_ms, feedback(0–100), drylevel_db, wetlevel_db              |
| `echo4`   | dry_db, wet_db, feedback(0–100), delay_ms — BASS legacy mapping  |
| `itecho`  | wetdrymix(0–100), feedback(0–100), leftdelay_ms, rightdelay_ms, pandelay |
| `delay`   | ch0_ms, ch1_ms, max_delay_ms                                     |

### 7.3 Modulation

| Effect      | Parameters                                                 |
|-------------|------------------------------------------------------------|
| `chorus`    | mix(0–100), rate_hz(0–20), depth(0–100)                    |
| `flange`    | mix(0–100), depth(0–100), rate_hz(0–20)                    |
| `tremolo`   | freq_hz, depth(0–1), shape(0–1), skew(-1..1), duty(0–1), square(0–1), phase(0–1), spread(-180..180) |
| `oscillator`| type(0–5: sine/square/sawup/sawdown/triangle/noise), rate_hz |

### 7.4 Filters

| Effect            | Parameters                            |
|-------------------|---------------------------------------|
| `lowpass`         | cutoff_hz(10–22000), resonance(1–10)  |
| `lowpass_simple`  | cutoff_hz                             |
| `itlowpass`       | cutoff_hz, resonance                  |
| `highpass`        | cutoff_hz(10–22000), resonance(1–10)  |
| `highpass_simple` | cutoff_hz                             |
| `bandpass`        | freq_hz, q(0.1–20), gain_db (legacy mapping)|

### 7.5 Equalisers

| Effect      | Parameters                                                                                                                            |
|-------------|---------------------------------------------------------------------------------------------------------------------------------------|
| `parameq`   | center_hz, bandwidth(octaves), gain_db                                                                                                |
| `three_eq`  | low_db, mid_db, high_db, low_xover_hz(default 250), high_xover_hz(default 4000), slope(0=12dB/oct, 1=24, 2=48)                        |
| `multiband_eq` | filter_a, freq_a, q_a, gain_a, … repeat for bands B, C, D, E (up to 5 bands). filter type: 0=disabled, 1=lowpass12, 2=lowpass24, 3=lowpass48, 4=highpass12, 5=highpass24, 6=highpass48, 7=lowshelf, 8=highshelf, 9=peaking, 10=bandpass, 11=notch, 12=allpass |

### 7.6 Dynamics

| Effect       | Parameters                                                                |
|--------------|---------------------------------------------------------------------------|
| `compressor` | threshold_db, ratio, attack_ms, release_ms, makeup_db                     |
| `limiter`    | release_ms(1–1000), ceiling_db(-12..0), maximizer_gain_db(0..12)          |
| `normalize`  | fadetime_ms, threshold(0–1), maxamp(1–20)                                 |

### 7.7 Pitch / volume utility

| Effect       | Parameters                                                       |
|--------------|------------------------------------------------------------------|
| `pitchshift` | pitch(0.5–2 = ±octave), fft_size(256/512/1024/2048/4096), overlap(4–32) |
| `distortion` | level(0–1)                                                       |
| `fader`      | gain_db                                                          |
| `volume`     | linear_volume(0–1) — legacy BGT mapping → dB internally          |
| `lvolume`    | linear_amp(0–1) — same as `volume`, kept for naming compatibility |

### 7.8 Examples

```angelscript
sound s; s.load("rifle.ogg");
s.set_fx("$verb:reverb:1500:10:30:5000:50:80:80:200:0:8000:60:0:-12");  // hall-ish
s.set_fx("$lp:lowpass:2000:1");                                         // muffle behind wall
s.play();
// later …
s.set_fx("$lp");          // remove the lowpass when player exits the wall
```

---

## 8. Master EQ & Master Volume

```angelscript
sound_master_volume = 80;             // 0..100 linear

sound_master_eq(2, 0, -3);            // +2 dB lows, flat mids, -3 dB highs
sound_master_eq_mid = 1.5;            // tweak a single band
```

The master EQ runs after every mixer, so it is the final tone shaper before the soundcard.

---

## 9. HRTF (Binaural 3D) — Steam Audio

Two ways to enable:

```angelscript
king_global_hrtf = true;     // every NEW sound starts with HRTF on
sound s; s.load(...); s.set_hrtf(true);  // per-sound override
```

- HRTF requires a stereo output device.
- The DSP is "primed" with a silent buffer when created → no first-frame artifacts.
- At distance 0 with `volume_step = 0` style configuration, the engine bypasses Steam Audio and does plain stereo passthrough (so a stereo asset stays stereo).
- Stereo input runs **two** binaural effects with a 20° spread, then sums them, giving a wide stereo image rather than a single point source.

Tuning (global):

| Property                    | Default | Meaning                                                        |
|-----------------------------|---------|----------------------------------------------------------------|
| `hrtf_near_field_radius`    | engine  | Inside this radius, near-field bass boost is added             |
| `hrtf_dead_zone`            | engine  | Inside this radius, the spatializer collapses to centred stereo |

---

## 10. Sound Environment (Phonon Acoustics)

Build static geometry to get occlusion / muffling between listener and sources.

```angelscript
sound_environment_add_material("metal", 0.10, 0.05, 0.02, 0.5, 0.0, 0.0, 0.0);
//                              name    abs_lo abs_mid abs_hi scatter trans_lo trans_mid trans_hi
sound_environment_add_wall(0, 100, 0, 1, 0, 30, "metal", 1);     // box bounds + material name + id
sound_environment_add_platform(0, 100, 50, 51, 0, 30, "concrete", 2);
sound_environment_commit();          // upload to Phonon
```

Other helpers:

```angelscript
sound_environment_remove_wall(int id);
sound_environment_reset();
int sound_environment_check_wall(float lx, float ly, float lz, float sx, float sy, float sz);
string sound_environment_debug();
bool SOUND_ENVIRONMENT_ACTIVE;       // property
```

> Known issue: vertical (Z) elevation perception is currently weaker than horizontal — being revisited.

---

## 11. Pack Files (`king_pack`, `king_virtual_pack`)

Encrypted asset bundles loaded from disk (`king_pack`) or kept entirely in RAM (`king_virtual_pack`).

```angelscript
king_pack p;
p.add_file("music/theme.ogg", "src/theme.ogg");
p.add_from_memory("config.txt", "answer=42");
p.open("game.dat", "secretkey");
set_default_pack(@p);                // optional; makes future loads fall through to p
sound s; s.load("music/theme.ogg");  // loaded from p
```

API (identical for both classes):

```angelscript
bool   open(const string &in path, const string &in key);
void   close();
bool   add_file(const string &in name, const string &in src_path);
bool   add_from_memory(const string &in name, const string &in data);
uint64 get_file_count();
string get_file_name_at(uint64 i);
string get_file_content(const string &in name);
bool   file_exists(const string &in name);
uint64 get_file_size(const string &in name);
bool   extract_file(const string &in name, const string &in out_path);
string[]@ get_file_list();
```

Stand-alone helpers:

```angelscript
bool king_encrypt_file(const string &in src, const string &in dst, const string &in key);
bool king_decrypt_file(const string &in src, const string &in dst, const string &in key);
```

---

## 12. `king_microphone` — Recording, Live Monitoring, Voice Pipelines

```angelscript
king_microphone mic;          // factory — uses currently selected sound_input_device
king_microphone mic2(2);      // explicit device index
```

### 12.1 Configurable BEFORE `start()`

| Property         | Default | Range / Notes                                              |
|------------------|---------|------------------------------------------------------------|
| `sample_rate`    | 48000   | 8000 – 192000 Hz. For Opus/VoIP keep at 48000              |
| `channels`       | 1       | 1 (mono) or 2 (stereo). Voice always 1.                    |
| `buffer_length`  | 2.0     | seconds, 0.5 – 300. Internal ring buffer length            |
| `device`         | -1      | -1 = use global `sound_input_device`, else explicit index  |

Configurable any time:

| Property | Default | Range / Notes                                                            |
|----------|---------|--------------------------------------------------------------------------|
| `volume` | 1.0     | playback monitor volume only (does not affect captured data)             |
| `gain`   | 100     | 0–200 percent (0 silent, 100 unity, 200 = 2× pre-amp on captured data)   |

### 12.2 Methods

```angelscript
bool start();              // begins capture
bool stop();               // stops capture and playback
bool play_back();          // live monitoring (your voice through the speakers)
bool play_back(mixer@);    // live monitoring routed into a mixer
void stop_playback();
bool save(const string &in wav_filename);
string get_data();         // returns NEW PCM16 bytes since the previous call
bool   is_recording();
bool   active;             // property — same as is_recording()
```

`get_data()` is the heart of the streaming pipeline: every call returns whatever new audio has been captured since the previous call, so feeding Opus is just a loop.

### 12.3 Quick recipes

Record-to-file:

```angelscript
king_microphone mic;
mic.buffer_length = 30;             // 30 sec ring buffer
mic.start();
wait(5000);
mic.save("out.wav");
mic.stop();
```

Live "echo my voice" monitor:

```angelscript
king_microphone mic;
mic.gain = 130;                      // mild boost
mic.start();
mic.play_back();
```

Push raw PCM into a streaming sound (no codec):

```angelscript
king_microphone mic; mic.start();
sound s;
while (true) {
    string chunk = mic.get_data();
    if (chunk.length() > 0)
        s.push_memory(chunk, false, mic.sample_rate, mic.channels);
    wait(5);
}
```

---

## 13. Opus Codec (Voice Compression)

Embedded Opus 1.3.1 — no separate DLL. ID-based, mutex-protected, safe to use across threads.

### 13.1 Defaults (VoIP-tuned)

| Setting    | Default    | Why                          |
|------------|------------|------------------------------|
| Bitrate    | 24 000 bps | Excellent voice quality      |
| Frame size | 20 ms      | Standard VoIP packet length  |
| Mode       | VBR        | Higher quality at same avg bitrate |
| FEC        | on         | Forward error correction recovers lost packets |
| DTX        | on         | Stops sending during silence (saves bandwidth) |
| Complexity | 6          | CPU/quality balance          |
| Packet loss| 5 %        | Tells the encoder to expect 5 % network loss |

### 13.2 Encoder

```angelscript
int  opus_encoder_create(int sample_rate, int channels, int bitrate = 24000, int frame_ms = 20);
bool opus_encoder_destroy(int id);
string opus_encode(int id, const string &in pcm16_data);     // PCM16 in, opus out
string opus_encode_float(int id, float[]@ pcm);              // float [-1..1]
bool opus_encoder_set_bitrate(int id, int bps);              // 6 000 – 510 000
bool opus_encoder_set_complexity(int id, int c);             // 0 – 10
bool opus_encoder_set_fec(int id, bool enable);
bool opus_encoder_set_dtx(int id, bool enable);
bool opus_encoder_set_packet_loss(int id, int percent);      // 0 – 100
bool opus_encoder_set_signal(int id, int signal);            // 3000=auto, 3001=voice, 3002=music
bool opus_encoder_reset(int id);                             // clear internal state
```

Frame buffering: the encoder accumulates samples and only emits a packet when a full frame is ready. So `opus_encode()` may return an empty string until enough audio has been pushed — that's normal.

### 13.3 Decoder

```angelscript
int  opus_decoder_create(int sample_rate, int channels, int frame_ms = 20);
bool opus_decoder_destroy(int id);
string opus_decode(int id, const string &in encoded_packet);
int  opus_decode_float(int id, const string &in encoded_packet, float[]@ pcm);
bool opus_decoder_reset(int id);
```

### 13.4 Recommended bitrate / sample-rate combos

| Scenario        | Sample rate | Channels | Bitrate    | Frame |
|-----------------|-------------|----------|------------|-------|
| Voice chat (low bandwidth) | 16 000 Hz | 1 | 12 000 bps | 40 ms |
| Voice chat (default)       | 48 000 Hz | 1 | 24 000 bps | 20 ms |
| Voice chat (HQ)            | 48 000 Hz | 1 | 32 000 bps | 20 ms |
| Stereo music               | 48 000 Hz | 2 | 96 000 bps | 20 ms |

### 13.5 Compress-then-decompress demo

```angelscript
int enc = opus_encoder_create(48000, 1);
int dec = opus_decoder_create(48000, 1);

string pcm = mic.get_data();          // captured PCM16
string pkt = opus_encode(enc, pcm);   // tiny network-friendly blob
// … send pkt over the network …
string out = opus_decode(dec, pkt);

opus_encoder_destroy(enc);
opus_decoder_destroy(dec);
```

---

## 14. `sound_pool.nvgt` — High-level Spatial Sound Manager

`sound_pool` rents a fixed number of `sound` objects and handles all the bookkeeping for a 1D / 2D / 3D scene. Same API surface as legacy BGT/NVGT, adapted for king_audio.

```angelscript
#include "sound_pool.nvgt"

sound_pool pool(150);          // 150 simultaneous slots
pool.pan_step = 1.0;
pool.volume_step = 1.0;
pool.behind_pitch_decrease = 0.25;   // sounds behind you drop in pitch slightly
pool.max_distance = 150;             // unload looping sounds beyond 150 units
pool.hrtf = true;                    // every sound played by THIS pool gets HRTF
```

### 14.1 Play methods

| Method                        | Purpose                                       |
|-------------------------------|-----------------------------------------------|
| `play_stationary(...)`        | UI / no spatialisation                        |
| `play_1d(...)`                | Left-right only                               |
| `play_2d(...)`                | XY plane (with optional rotation)             |
| `play_3d(...)`                | Full 3D, optional streaming                   |
| `play_extended_*` variants    | Same but expose ranges, offset, pan/vol/pitch, persistent flag, mixer, fx list |

Each returns a slot index (>=0) or -1/-2 on failure (no free slot, or out of range).

```angelscript
int slot = pool.play_3d("door.ogg", px, py, pz, 10, 5, 0, rotation, false /*looping*/);
```

### 14.2 Listener updates (per frame)

```angelscript
pool.update_listener_1d(player_x);
pool.update_listener_2d(player_x, player_y, rotation_deg);
pool.update_listener_3d(player_x, player_y, player_z, rotation_deg);
```

These set the global listener AND call `king_system_update()` once at the end. If you have **multiple pools**, only the LAST `update_listener_*` per frame should call them — call `set_listener()` and `king_system_update()` yourself to coordinate.

### 14.3 Sound lifecycle

```angelscript
bool   pause_sound(int slot);
bool   resume_sound(int slot);
void   pause_all();
void   resume_all();
bool   destroy_sound(int slot);
bool   destroy_sounds(string owner);
void   destroy_all();
bool   sound_is_active(int slot);
bool   sound_is_playing(int slot);
```

### 14.4 Owners (group sounds)

```angelscript
pool.set_sound_owner(slot, "enemy_42", priority);
int s = pool.get_sound_by_owner("enemy_42", priority);
pool.update_sounds_3d("enemy_42", x, y, z, rotation);   // move every sound owned by enemy_42
pool.set_sounds_amp("enemy_42", priority, 0.5);          // fader fx applied to every matching sound
pool.destroy_sounds("enemy_42");
```

### 14.5 Per-slot updates

```angelscript
pool.update_sound_1d(slot, x);
pool.update_sound_2d(slot, x, y);
pool.update_sound_3d(slot, x, y, z);
pool.update_sound_position(slot, x, y, z);   // set without immediate refresh

pool.update_sound_range_1d(slot, left, right);
pool.update_sound_range_2d(slot, left, right, back, fwd);
pool.update_sound_range_3d(slot, left, right, back, fwd, lower, upper);

pool.update_sound_start_values(slot, start_pan, start_volume_db, start_pitch);
pool.update_sound_positioning_values(slot, pan_step, volume_step);

pool.set_sound_rotation(slot, theta_deg, vector(pivot));
pool.set_sounds_rotation("owner", theta_deg, vector(pivot));
```

### 14.6 Streaming PCM into a slot

```angelscript
pool.sound_push_memory(slot, pcm_chunk, end_stream, sample_rate, channels);
double t = pool.sound_last_memory_push_time(slot);   // ms since last push
```

### 14.7 Configuration knobs

| Property                  | What it does                                                            |
|---------------------------|-------------------------------------------------------------------------|
| `bool y_is_elevation`     | Treat Y as height instead of depth (per pool)                           |
| `bool sound_pool_default_y_elevation` | Same flag, applied as default to every new pool             |
| `int  max_distance`       | Looping sounds farther than this stop streaming. 0 = never              |
| `float pan_step`          | Multiplier for stereo pan derived from horizontal offset                |
| `float volume_step`       | Multiplier for distance attenuation                                     |
| `float behind_pitch_decrease` | Pitch drop applied to sources behind the listener                   |
| `bool hrtf`               | HRTF on/off for sounds created by this pool                             |
| `mixer@ mixer`            | Default mixer attached to every new sound                               |
| `king_pack@ pack_file`    | Default pack used when a play call passes `null`                        |

---

## 15. `voice_chat.nvgt` — Drop-in 3D VoIP Helper

A tiny class wrapping a per-player Opus decoder + spatialised streaming sound. Designed for multiplayer worlds where each remote player has a position on a map.

```angelscript
#include "voice_chat.nvgt"

// when a player joins
spawn_voice_chat(px, py, pz, "username", "map1");

// each network packet from that player
int idx = get_voice_chat_index("username");
if (idx >= 0) voice_chats[idx].push_voice_data(packet_bytes);

// when the player moves
update_voice_chat("username", new_x, new_y, new_z, "map1");

// in your main loop, once per frame
for (uint i = 0; i < voice_chats.length(); i++) {
    voice_chats[i].update_listener_position(me.x, me.y, me.z, facing);
}

// when the player leaves
remove_voice_chat("username");
```

Behaviour notes:

- HRTF is forced on for every `voice_chat`.
- 25-unit cull radius (squared distance > 2500): packets from far players are dropped immediately.
- 300 ms inactivity timeout closes the streaming sound automatically (so a disconnected player stops emitting).
- Pitch drops by `behind_pitch_decrease` (default 5) when the speaker is behind you.
- The class also calls `apply_effects(...)` from `update_voice_chat`, expecting a `map_get_fx_list_from_location(...)` helper from your map system. If you don't have one, edit `apply_effects` or stub the function out.

---

## 16. End-to-End Voice-Chat Wiring (sender side)

```angelscript
king_microphone mic;
mic.sample_rate = 48000;
mic.channels    = 1;
mic.start();

int enc = opus_encoder_create(48000, 1);              // 24 kbps default
opus_encoder_set_packet_loss(enc, 8);                 // expect 8% loss on this network

while (game_running) {
    string pcm = mic.get_data();                      // new audio since last loop
    if (pcm.length() > 0) {
        string pkt = opus_encode(enc, pcm);
        if (pkt.length() > 0) network_send(pkt);
    }
    wait(20);                                         // match 20 ms frame
}
```

Receiver side: see `voice_chat.nvgt` example above.

---

## 17. Volume & Distance Reference

- **Sound volume:** -100 dB (silent) … 0 dB (full). Same scale as legacy NVGT/BGT.
- **Mixer volume:** -100 … 0 dB.
- **Master volume:** 0 (silent) … 100 (full), linear percentage.
- **HRTF:** distance attenuation handled inside Steam Audio.
- **Non-HRTF 3D path:** activates only when `set_position()` has been called at least once. Uses a flat FMOD rolloff so distance attenuation is purely manual (`base_volume_db + dist_amp` combined inside `set_position`).
- **2D / UI sounds:** never call `set_position()` and they stay perfectly centred.

---

## 18. Common Pitfalls

1. **`set_fx` after `play`** → effects lost. Always `load → set_fx → play`.
2. **Forgetting `king_system_update()`** → 3D updates appear sluggish or frozen.
3. **Calling `set_listener` per-sound** → the last call wins; use it ONCE per frame from your main loop or the LAST sound_pool update.
4. **Wrapping rotation with `calculate_theta()`** → rotation is already degrees; you'll inject double conversion.
5. **3D positioning on stereo files without HRTF** → FMOD's classic 3D collapses stereo to mono. Either use HRTF or accept mono.
6. **Recreating an Opus encoder every packet** → expensive. Create once, reuse.
7. **Calling `mic.sample_rate = X` while recording** → ignored. Stop, change, start.
8. **Using master_volume above 100** → clamped to 100. For amplification, use a `fader` fx with a positive dB.

---

## 19. File Layout (shipped)

```
king_audio_engine.dll                       — the plugin
king_audio_engine/includes/sound_pool.nvgt  — high-level pool
king_audio_engine/includes/voice_chat.nvgt  — 3D VoIP helper
king_audio/king_audio_engine_EN.md          — this document
king_audio/king_audio_engine_TR.md          — Turkish version
```

(plus FMOD / Phonon support DLLs sitting next to the plugin)

---

## 20. Status

| Feature | State |
|---------|-------|
| WAV / OGG / MP3 / FLAC playback | ✅ |
| Streaming, push_memory PCM | ✅ |
| 3D positioning (HRTF + non-HRTF) | ✅ |
| Mixer hierarchy & routing | ✅ |
| Reverb (preset + custom)        | ✅ |
| 27+ DSP effects                 | ✅ |
| Master EQ + master volume       | ✅ |
| Microphone capture + monitor    | ✅ |
| Opus encode/decode (PCM16 + float)| ✅ |
| Sound environment walls/materials | ✅ |
| Pack files (encrypted)          | ✅ |
| Convolution reverb              | ⚠️ may crash on some IRs |
| Phonon vertical (Z) acoustics   | ⚠️ elevation perception under review |
