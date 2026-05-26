# NVGT Deployment Art & Performance Optimization

Master guide for packaging, distributing, and optimizing high-fidelity audio games.

## 📦 Professional Packaging

### 1. Asset Embedding (`#pragma asset`)
Ensure one-shot deployment by embedding sounds directly into the executable:
- **Usage**: `#pragma asset "sounds/jump.wav"`
- **Benefit**: Reduces the risk of "File Not Found" errors and protects your original audio files.
- **Library Inclusion**: If your script requires a specific header, use `#include "menu.nvgt"`.

### 2. File Organization
- `build/`: Target folder for the final .exe or bundle.
- `data/`: Temporary storage for game saves/INI during testing.
- `sounds/`: Organized subfolders for `music`, `sfx`, and `voice`.

## ⚡ Performance Profiling

### 1. Loop Timing
- **Wait Policy**: Every `while` loop MUST have a `wait(5);` or greater.
- **CPU Spikes**: Avoid running complex math (e.g., thousands of distance calculations) *every* loop iteration. Use a timer to run heavy logic every 50-100ms.

### 2. Audio Optimization
- **Slot Management**: Use `sound_pool.reserve_slot()` to prevent overwriting critical global sounds (like music or main sfx).
- **Fade Transitions**: Use `music.crossfade()` instead of stopping and starting sounds simultaneously to avoid "pop" or "click" artifacts.

## 🌍 Cross-Platform Strategy
- **File Paths**: Always use forward slashes `/` (`sounds/engine.wav`). NVGT will handle the conversion for Windows/Mac/Linux.
- **Platform Flags**: Use preprocessor directives if you need platform-specific logic:
  ```nvgt
  #if PLATFORM_WINDOWS
      speak("Welcome to Windows.");
  #elif PLATFORM_MAC
      speak("Welcome to macOS.");
  #endif
  ```

## High-Fidelity Debugging
- **Logging**: Use `#include "logger.nvgt"` and `logger.log("Info", "Level started")`.
- **Handle Null-Checks**: Always check if a handle is valid before use:
  ```nvgt
  sound@ s = sound();
  if(s !is null) {
      s.load("...");
  }
  ```
