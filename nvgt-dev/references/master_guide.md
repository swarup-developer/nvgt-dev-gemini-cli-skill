# NVGT Expert Master Guide

Follow these rules for ultra-fast, bug-free development.

## 1. UI Mastery
- ALWAYS use `#include "speech.nvgt"` or `#include "menu.nvgt"`.
- Use the **Non-Blocking Menu** pattern:
```nvgt
menu m;
m.add_item("Start Game");
m.add_item("Exit");
while(m.monitor()) {
    wait(5);
}
if(m.selected_item == 1) exit();
```

## 2. Audio Engineering
- Use `@` for every sound object: `sound@ s = sound();`.
- **Spatial**: Use `sound_pool.play_2d` for Top-Down worlds. 
- **Elevation**: Use `y` or `z` coordinates. **NEVER use pitch bend for elevation**. Pitch is only for speed/Doppler.
- **Cleanup**: Always `s.close(); @s = null;` when done.

## 3. High-Fidelity Physics
- For walls/collisions, check the next position BEFORE moving:
```nvgt
float nx = x + speed * delta;
if(!map.check_collision(nx, y)) x = nx;
```
- **Time**: Always multiply movement by a delta time or use a constant small `wait(10)` step.

## 4. One-Shot Success Checklist
- [ ] Added `wait(5);` in the main loop?
- [ ] Used `@` for all handles?
- [ ] Verified API signatures with `nvgt_researcher.py`?
- [ ] Downloaded real audio with `asset_manager.py`?
- [ ] No Python-generated placeholder sounds?

## 5. Tool Priority (MANDATORY)
1. **Script over Browser**: If the browser tool fails even once, IMMEDIATELY switch to `asset_manager.py` for downloads or `github_search.py` for info.
2. **Transparency**: Always explain to the User what tool you are using and why.
3. **Redundancy**: If a download fails, try a DIFFERENT source from `asset_manager.py` advice.

## 6. Common Logic Fixes (e.g. "Wall not moving")
- **The Space/Up Issue**: In 2D games, "Up" is often increasing Y. Ensure you are updating the correct coordinate and, most importantly, **passing the updated coordinates to the sound pool**.
- **Update the Pool**: If only the variable `wall_y` changes but you don't call `pool.update_sound_3d(slot, x, wall_y, z)`, the sound won't move in the audio world!
