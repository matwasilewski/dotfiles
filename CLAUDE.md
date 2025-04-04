# CLAUDE.md for Dotfiles

## Commands
- Bootstrap: `./bootstrap.sh` (symlinks dotfiles to home directory)
- MacOS setup: `./macbook_setup.sh` (installs packages and configures macOS)
- Python linting: `python-lint` (runs black, flakeheaven, isort, mypy with uv or poetry)
- Test fixture extraction: `python python_tools/fixture_extract.py <input_path> [--output fixtures.py]`
- Docker cleanup: `docker-rm-1h` (removes containers exited in last hour)

## Code Style
- Python:
  - Line length: 120 characters
  - Use Black formatter (skip string normalization)
  - Apply isort with black profile
  - Type annotations required and checked with mypy
  - Follow flake8 conventions (plugins: bugbear, docstrings, pytest-style)
- Shell scripts:
  - Use meaningful function names with underscore_case
  - Document function purpose with comments
  - Handle errors with appropriate exit codes
  - Prefer parameter expansion over command substitution when possible

## Git Practices
- Commit messages: concise, present tense, describe purpose
- Use Cursor for difftool
- Default branch: main
- User info should be configured in ~/.gitconfig.local

## Configuration
- Personal settings belong in:
  - ~/.zshenv_local (environment variables)
  - ~/.local-functions (custom functions)
  - ~/.gitconfig.local (git user info)