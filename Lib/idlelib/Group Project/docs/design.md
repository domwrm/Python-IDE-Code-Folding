# Design Document: Code Folding Feature for IDLE

Authors: Peter, Ryan, Domonick, Brendon

## Status

Proposed

## Context and Problem Statement

Currently, the IDLE UI lacks a code folding feature which allow users to collapse and expand code blocks (e.g., functions, classes, loops). This is especially important for improving navigation and readability in large files.
While this feature is standard in most modern IDEs (e.g. VSCode, PyCharm), this feature is not present in IDLE likely due to limitations in the Tkinter Text widget and its stronger focus on a beginner target audience where long code files are less common.
We believe that incorporating this feature will make IDLE a more comprehensive IDE and pave a solid step towards attracting a wider coding audience.

## Requirements

For the given constraints of this project, the below are the requirements of the feature we have decided.

- **Detect foldable blocks**: Functions, classes, loops, and conditionals
- **UI integration**: Visual markers (e.g., +/-) to fold/unfold blocks

Below are some additional checkpoints that are important to user experience and accessibility:
- **Editing constraints**: Prevent editing inside folded blocks
- **Undo/redo support**: Folding/unfolding should not corrupt undo history
- **Persistence**: Handle opening new files, re-parsing, and clearing folds
- **Keyboard shortcuts**: Support for folding/unfolding via keyboard

## Technical Constraints

- Tkinter Text widget does not natively support hiding lines
- Must not break existing IDLE workflows or introduce instability
- Should be maintainable and extensible

## Alternatives

### 1. **AST-based Block Detection + Text Widget Manipulation (Chosen)**
- Use Python's `ast` module to parse source and identify foldable blocks, and integrate with Tkinter Text widget
- **Pros**: Leverages Python's parsing capabilities; robust to syntax; extensible
- **Cons**: Requires careful management of text indices and undo/redo

### 2. **Regex-based Block Detection**
- Use regular expressions to find foldable blocks
- **Pros**: Simpler implementation
- **Cons**: Fragile; fails with complex or nested code; not robust

### 3. **Custom Text Widget**
- Implement or integrate a custom widget that supports line hiding
- **Pros**: Clean solution
- **Cons**: High effort; risk of breaking IDLE compatibility; maintenance burden

### 4. **Overlay Approach**
- Overlay folded regions visually without removing lines
- **Pros**: Preserves text indices
- **Cons**: Not supported by Tkinter; complex to implement

## Decision

We will use the AST-based block detection and Text widget manipulation approach

- **Block detection**: Use `ast` to parse and identify foldable blocks
- **Folding**: Remove lines from the Text widget and store them in a data structure
- **Unfolding**: Restore lines from memory
- **UI**: Add a sidebar with clickable markers for folding/unfolding
- **Editing**: Disable editing inside folded blocks
- **Undo/redo**: Integrate with IDLE's undo/redo stack to ensure consistency
- **Shortcuts**: Add keyboard shortcuts for folding/unfolding
- **Re-parsing**: On file open or edit, re-parse and update fold markers

## Justification

Considering the options, below are justifications behind our chosen approach
- AST-based detection is robust, accurate, and maintainable
- Text widget manipulation is feasible and aligns with IDLE's structure
- UI markers are familiar to users of other IDEs

Additionally, our group members are familiar with the `ast` module through PA3. 
Given the time constraint and scope of this project, we believe that this approach would allow us to implement the chosen feature while adhering to comprehensive testing.

## Open Questions

- How to handle syntax errors in user code?
- Should folding state persist across sessions?
- How to handle very large files efficiently?

## References

- [Tkinter Text widget documentation](https://docs.python.org/3/library/tkinter.html#text-widget)
- [Python AST module](https://docs.python.org/3/library/ast.html)
- [VSCode Source - Reference for Code-Folding Implementation](https://github.com/microsoft/vscode)
