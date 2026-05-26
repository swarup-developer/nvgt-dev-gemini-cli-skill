# BGT to NVGT Porting Guide (Pro-Level)

Porting BGT code requires a deep understanding of AngelScript's transition to a modern, handle-driven language. Gemini, you MUST follow these mapping rules for 100% SUCCESS.

## Core Language Mappings

| Feature | BGT (Legacy) | NVGT (Modern) |
|---|---|---|
| **Handles** | `sound s;` | `sound@ s = sound();` |
| **Pointers** | `menu m;` | `menu@ m = menu();` |
| **Wait** | `wait(5.0);` (double) | `wait(5);` (uint ms) |
| **Strings** | `string a = b;` | `string a = b;` (same) |
| **Arrays** | `sound[] s(10);` | `sound[] s(10);` (pre-allocate required) |
| **Mixins** | Not available | Use `mixin class` for reuse |

## Specific Class Conversions

### `sound` class
- **BGT**: `s.load("...");` 
- **NVGT**: `s.load("...");` (same API, but use handles as `@s`).
- **NVGT Native**: `sound_play("...")` returns a handle if you don't need persistent control.

### `menu` class
- **BGT**: Often required manual looping with `wait()`.
- **NVGT**: Use the `menu` class's `monitor()` or `run()` methods.
- **Mapping**: `m.add_item("Text", "id");` -> `m.run();` -> `m.selected_item`.

### `file` class
- **BGT**: `file f; f.open("...", "r");`
- **NVGT**: `file f; f.open("...", "rb");` (Explicit binary vs text modes).

## Systematic Porting Workflow

1.  **Refactor Main**: Convert `void main()` to a structure that initializes a global `engine` or `game` controller.
2.  **Handle Injection**: Replace all standalone object declarations with handle `@` declarations.
3.  **Path Sanitization**: Ensure paths use `/` and not `\`.
4.  **BGT Compatibility**: If the project is huge, use `#include "bgt_compat.nvgt"`. However, **native NVGT code is 100% preferred** for performance and reliability.
5.  **Research**: If you see a method you don't recognize, use `scripts/nvgt_researcher.py` to check the latest header files on GitHub.
