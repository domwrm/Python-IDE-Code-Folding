### Change Log: 20250603

Added implementation to display the `+` button to the right of the line numbers in the sidebar.
Uses the `find_foldable_regions` output to display the button on the starting line of a foldable region.
Refreshes/updates everytime there is a change to the number of lines (similar to how the original line numbers were being updated in the sidebar)
Currently, on the click of the `+` button, it just prints information about the fold to the terminal, will implement actual folding later.

Added automated linting script and yaml file to auto format code using pre-commit hooks.

### Change Log: 20250528

Added implementation for parsing code with `find_foldable_regions` and updated unit tests


### Change Log: 20250519

Modified the Github Repository Settings:
- Each new addition/feature must be added by creating a separate branch and Pull Request to `main`
- Each PR requires at least 1 approval before merging
- Updated settings to automatically delete branch head after merge