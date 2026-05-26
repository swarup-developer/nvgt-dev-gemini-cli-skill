# One-Shot Compilation Protocol

Gemini, you MUST follow this checklist before finishing any task to guarantee zero errors and 100% SUCCESS.

## Pre-Computation Checklist

1.  **Circular Includes Check**: Are there any circular `#include` dependencies? If so, move the shared objects to a common library.
2.  **Handle Matching**: Did you use `@` for all reference-counted objects (`sound`, `menu`, `file`, `network`)?
3.  **Path Sanitization**: Did you use forward slashes `/` for all filenames?
4.  **Enum/Const Verification**: Did you verify existence of constants (e.g., `KEY_ENTER`, `AUDIO_POSITIONING_ABSOLUTE`) in `api_reference.md` or via `scripts/nvgt_researcher.py`?
5.  **Main Loop Logic**: Did you include a `wait()` call in every `while(true)` or `while(active)` loop? (Crucial for performance and window responsiveness).
6.  **Return Types**: Does every function branch return the correct type? (e.g., `bool` functions must return `true`/`false`).

## Syntax Verification

If you are unsure of a class's methods:
1.  **Research**: Use `python scripts/nvgt_researcher.py --full filename.nvgt`.
2.  **Verify**: If a method is not in the fetched content, **DO NOT USE IT**.
3.  **Native vs Compat**: Always prefer native NVGT classes over `bgt_compat` equivalents for new projects.

## Compilation Error Recovery
If the user reports an error:
1.  **Read the Trace**: Identify the exact line and error message.
2.  **Analyze Header**: Use `nvgt_researcher.py` to see if the method signature changed in the latest release.
3.  **One-Shot Fix**: Apply the fix to the entire architecture, not just the error line. Ensure no other dependent code is broken.
