#!/bin/bash

set -e

# Add ~/.local/bin to PATH if not already present
export PATH="$HOME/.local/bin:$PATH"

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"

cd "$PROJECT_ROOT"

echo "Installing pre-commit, black, and isort..."
pip install --user pre-commit black isort

CONFIG_FILE=".pre-commit-config.yaml"

if [ ! -f "$CONFIG_FILE" ]; then
  echo "Creating $CONFIG_FILE with black and isort hooks..."
  cat > "$CONFIG_FILE" <<EOL
repos:
  - repo: https://github.com/psf/black
    rev: 24.3.0
    hooks:
      - id: black
  - repo: https://github.com/pycqa/isort
    rev: 5.12.0
    hooks:
      - id: isort
EOL
else
  echo "$CONFIG_FILE already exists. Skipping creation."
fi

echo "Installing pre-commit hooks..."
pre-commit install

echo "Done! Pre-commit hooks for black and isort are set up."
