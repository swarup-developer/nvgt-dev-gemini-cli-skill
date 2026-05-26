# Audio Asset Management Protocol

In an audio game, assets are the UI. Their quality and organization are paramount.

## The Responsibility Question
**Mandatory Planning Step**: You MUST ask the user:
> "Who should handle the audio assets for this project?
> - **AI (Fast)**: I will find, download, and organize suitable sounds automatically using my tools.
> - **User (Custom)**: You will provide the files, and I will generate a list of required assets and folder structures for you."

### Path A: AI Handles (Automated)
1.  **Draft Needs**: Identify all required sounds (e.g., footsteps, menus, ambiances).
2.  **Search**: Use `search_web` to find high-quality links on Freesound, OpenGameArt, or similar.
3.  **Download**: Use `python scripts/asset_manager.py --download "URL" --target "sounds/..."` to automatically pull them into the project.
4.  **Organize**: Group sounds logically (e.g., `sounds/ui/`, `sounds/player/`, `sounds/amb/`).

### Path B: User Handles (Manual)
1.  **Generate Asset List**: Produce a detailed table/list of every sound required.
2.  **Define Folders**: Provide a clear directory structure for the user to populate.
3.  **Placeholder Logic**: Write the code to check for file existence and alert the user if a sound is missing.

## Audio Fallback Strategy
If you encounter an error in the browser tool while fetching assets:
1.  **Fallback 1**: Switch to simple `search_web` queries.
2.  **Fallback 2**: Use generic keywords (e.g., "royalty free wav footprint grass").
3.  **Fallback 3**: Search for "Soniss GDC bundles" or "Game Audio GDC" for free high-quality packs.

## Format Guidelines
- **Format**: Prefer `.wav` for short SFX (low latency) and `.ogg` or `.mp3` for long ambiances/music.
- **Looping**: Ensure ambiances are noted as `loopable`.
- **Naming**: Use descriptive, snake_case names (e.g., `footstep_stone_run_01.wav`).
