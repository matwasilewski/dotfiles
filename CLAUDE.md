# CLAUDE.md for Dotfiles

## Commands
- Bootstrap: `./bootstrap.sh` (symlinks dotfiles, installs oh-my-zsh, plugins, brew packages)
- Brew packages: `brew bundle` (installs from Brewfile)
- Test fixture extraction: `python python_tools/fixture_extract.py <input_path> [--output fixtures.py]`

## Useful Aliases
- Git: `gs` (status), `gco` (checkout), `gps` (push), `gpl` (pull), `gf` (fetch), `glog`
- Docker: `dps` (ps), `dpsa` (ps -a), `dstop` (stop all)
- Make: `mf` (format), `mt` (test), `mr` (run)
- Python: `venv` (create .venv), `jn` (jupyter notebook)

## Useful Functions
- `port 8080` - Show what's using a port
- `killport 8080` - Kill process on port
- `psg python` - ps aux | grep
- `gcr-logs [service] [project] [region]` - Cloud Run logs
- `docker-rm-1h` / `docker-rm-24h` - Cleanup exited containers
- `clip-branch file.py [branch]` - Copy file contents from branch to clipboard
- `cursor-diff file.py [branch]` - Open diff in Cursor

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
  - ~/.zshenv_local (environment variables, JAVA_HOME, GOOGLE_CLOUD_SDK_PATH)
  - ~/.local-functions (custom functions)
  - ~/.gitconfig.local (git user info)
