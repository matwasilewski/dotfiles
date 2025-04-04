# Dotfiles

A personal dotfiles configuration running [**oh-my-zsh**](https://github.com/robbyrussell/oh-my-zsh) with [**PowerLevel10k**](https://github.com/romkatv/powerlevel10k) theme. Inspired by [**Holman's dotfiles**](https://github.com/holman/dotfiles).

## Features

* Automatic installation of oh-my-zsh, plugins, and PowerLevel10k theme
* Symlinks all `.symlink` files to your home directory
* Installs essential dependencies (Homebrew, git, wget)
* Sets up useful aliases and functions for daily development work
* Configures git with your credentials
* Creates local configuration files for custom settings

## Files

* `aliases.symlink` - Custom aliases (git-aliases provided by [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh/wiki/Plugin:git))
* `functions.symlink` - Bash/zsh functions, called by aliases
* `terraform_functions.symlink` - Terraform specific helper functions
* `vimrc.symlink` - Vim configuration
* `zshenv.symlink` - Environment variables
* `zshrc.symlink` - ZSH configuration, sources aliases and functions
* `gitconfig.symlink` - Git configuration with Cursor as difftool

## Installation

### Prerequisites
* On macOS: Xcode Command Line Tools (`xcode-select --install`)
* On Windows: [WSL](https://learn.microsoft.com/en-us/windows/wsl/install) with Ubuntu

### Quick Start

1. Clone this repository:
   ```bash
   git clone https://github.com/USERNAME/dotfiles.git ~/.dotfiles
   cd ~/.dotfiles
   ```

2. Run the bootstrap script to install everything:
   ```bash
   ./bootstrap.sh
   ```
   
   This script will:
   - Install dependencies (Homebrew, git, wget)
   - Install oh-my-zsh and plugins
   - Install PowerLevel10k theme
   - Symlink dotfiles to your home directory
   - Create local configuration files

3. Configure macOS settings (optional):
   ```bash
   ./macbook_setup.sh
   ```

4. Restart your terminal or reload the configuration:
   ```bash
   source ~/.zshrc
   ```

## Customization

Create and edit these files for local customization (automatically created during installation):
* `~/.zshenv_local` - Local environment variables
* `~/.local-functions` - Local functions

## Utilities

* `python_tools/fixture_extract.py` - Extract pytest fixtures from Python files
* `intellij_scripts/` - Helper scripts for IntelliJ IDEA

## Terminal Configuration

For the best experience:
1. Install a [Nerd Font](https://www.nerdfonts.com/) for PowerLevel10k
2. Match your terminal's tab color with the background color
3. Add padding to all sides under terminal settings
