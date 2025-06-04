#!/bin/bash
set -e

# Ensure ~/.local/bin is in PATH for user installs
export PATH="$HOME/.local/bin:$PATH"

echo "PATH is: $PATH"
echo "Python version: $(python --version 2>&1)"
echo "Which pre-commit: $(command -v pre-commit || echo 'not found')"
echo "Which black: $(command -v black || echo 'not found')"
echo "Which isort: $(command -v isort || echo 'not found')"

# Only install if not already available
command -v pre-commit >/dev/null 2>&1 || pip install --user pre-commit
command -v black >/dev/null 2>&1 || pip install --user black
command -v isort >/dev/null 2>&1 || pip install --user isort

echo "Installing pre-commit hook in current directory..."
pre-commit install

echo "Done!"
