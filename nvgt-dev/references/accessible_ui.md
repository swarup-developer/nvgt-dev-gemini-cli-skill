# Non-Visual UI Design Patterns

In NVGT, the "UI" is a combination of speech, sounds, and keyboard inputs.

## The Menu System
Every audio game needs a robust, wrap-around menu.
- **Cycle Sounds**: Different pitches or click sounds for each menu item.
- **Edge Sounds**: A distinct "thud" or high-beep when the user reaches the top or bottom of the list.
- **Key Repeat**: Enable fast scrolling with arrow keys.

## Dialogue & Interaction
- **Speech Interrupts**: When the user moves quickly, interrupt the current speech to start the new one immediately (`speak(text, true)`).
- **Audio Feedback**: For actions like "Save", use a specific success chime instead of just speech.
- **Navigation Cues**: In a 3D world, use "Beeping Beacons" or "Panned Narration" to guide the player to their next objective.

## Accessibility Best Practices
1.  **Screen Reader Friendly**: Always default to NVGT's built-in `speech` module.
2.  **Toggle-able Speech**: Let the user choose between TTS and recorded voice.
3.  **Haptic/Audio Balance**: Use panning to reveal where an object is (Left/Right) and pitch to show elevation.
4.  **Confirmations**: Always require a clear "Enter" or "Space" for destructive actions.
