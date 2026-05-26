# Versioning & Documentation Protocol

To ensure 100% accuracy and zero hallucinations, follow these protocols for NVGT versioning.

## Baseline: The Latest Version
By default, assume the user wants the **latest version** of NVGT unless specified otherwise.

1.  **Check Local Version**: Run `nvgt` or check the installation path if possible. If the version is not found, assume `latest`.
2.  **Query GitHub**: Use `python scripts/github_search.py "latest release"` or `search_web` to find the current version at [samtupy/nvgt](https://github.com/samtupy/nvgt).
3.  **Reference the Correct Docs**:
    *   **Latest Docs**: Always check [nvgt.dev/docs/nvgt.txt](https://nvgt.dev/docs/nvgt.txt).
    *   **Source Truth**: For new classes (e.g., `mixer`, `network`), check the `include/` directory in the [GitHub repo](https://github.com/samtupy/nvgt/tree/master/release/include).

## Research Hierarchy
Prioritize documentation sources in this order:
1.  **Direct GitHub Source**: The header files (`.nvgt` or `.h`) in the repository contain the absolute truth of the API.
2.  **Official Text Docs**: `nvgt.txt` on the website.
3.  **Community Examples**: Existing games in the `samples/` directory of the repo.

## Reporting Changes
If you discover a discrepancy between your training data and the latest GitHub code, **inform the user**:
> "I've detected a recent API change in NVGT version X.Y.Z via GitHub. I will use the updated syntax for [Class/Method]."
