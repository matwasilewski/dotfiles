# Dotfiles

A personal dotfiles configuration running [**oh-my-zsh**](https://github.com/robbyrussell/oh-my-zsh) with [**PowerLevel10k**](https://github.com/romkatv/powerlevel10k) theme. Inspired by [**Holman's dotfiles**](https://github.com/holman/dotfiles).

## Features

* Automatic installation of oh-my-zsh, plugins, and PowerLevel10k theme
* Symlinks all `.symlink` files to your home directory
* Installs essential dependencies via Brewfile
* Sets up useful aliases and functions for daily development work
* Configures git with your credentials
* Sets up Claude Code with global configuration and rules
* Creates local configuration files for custom settings

## Files

* `aliases.symlink` - Custom aliases (git, docker, make shortcuts)
* `functions.symlink` - Bash/zsh functions
* `vimrc.symlink` - Vim configuration
* `zshenv.symlink` - Environment variables
* `zshrc.symlink` - ZSH configuration, sources aliases and functions
* `gitconfig.symlink` - Git configuration with Cursor as difftool
* `Brewfile` - Declarative Homebrew package list
* `claude/` - Global Claude Code configuration (symlinked to ~/.claude/)
* `.claude/` - Project-specific Claude Code configuration

## Installation

### Prerequisites
* On macOS: Xcode Command Line Tools (`xcode-select --install`)

### Quick Start

1. Clone this repository:
   ```bash
   git clone https://github.com/USERNAME/dotfiles.git ~/Code/dotfiles
   cd ~/Code/dotfiles
   ```

2. Run the bootstrap script to install everything:
   ```bash
   ./bootstrap.sh
   ```

   This script will:
   - Install dependencies (Homebrew, git)
   - Install oh-my-zsh and plugins
   - Install PowerLevel10k theme
   - Symlink dotfiles to your home directory
   - Set up Claude Code configuration
   - Create local configuration files

3. Restart your terminal or reload the configuration:
   ```bash
   source ~/.zshrc
   ```

## Customization

Create and edit these files for local customization (automatically created during installation):
* `~/.zshenv_local` - Local environment variables (JAVA_HOME, GOOGLE_CLOUD_SDK_PATH, etc.)
* `~/.local-functions` - Local functions
* `~/.gitconfig.local` - Git user info

## Claude Code Configuration

The `claude/` directory contains global Claude Code settings symlinked to `~/.claude/`:
* `claude/CLAUDE.md` - Global instructions for all projects
* `claude/settings.json` - Default permissions and model settings
* `claude/rules/` - Language-specific guidelines (python.md, shell.md, git.md)

To customize for specific projects, edit `.claude/CLAUDE.md` in that project.

## Utilities

* `python_tools/fixture_extract.py` - Extract pytest fixtures from Python files
* `functions.archive` - Archived functions (unused but kept for reference)

## Terminal Configuration

For the best experience:
1. Install a [Nerd Font](https://www.nerdfonts.com/) for PowerLevel10k
2. Match your terminal's tab color with the background color
3. Add padding to all sides under terminal settings
