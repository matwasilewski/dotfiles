#!/usr/bin/env bash
#
# bootstrap installs things.

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)

set -e

echo ''

info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

user () {
  printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

setup_gitconfig () {
  if ! [ -f gitconfig.local.symlink ]; then
    info 'setup gitconfig'

    git_credential='cache'
    if [ "$(uname -s)" == "Darwin" ]
    then
      git_credential='osxkeychain'
    fi

    user ' - What is your github author name?'
    read -e git_authorname
    user ' - What is your github author email?'
    read -e git_authoremail

    cat > gitconfig.local.symlink << EOF
# Local Git configuration
[user]
    name = $git_authorname
    email = $git_authoremail
[credential]
    helper = $git_credential
EOF

    success 'gitconfig'
  fi
}


link_file () {
  local src=$1 dst=$2

  local overwrite= backup= skip=
  local action=

  if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]
  then

    if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
    then

      local currentSrc="$(readlink $dst)"

      if [ "$currentSrc" == "$src" ]
      then

        skip=true;

      else

        user "File already exists: $dst ($(basename "$src")), what do you want to do?\n\
        [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
        read -n 1 action

        case "$action" in
          o )
            overwrite=true;;
          O )
            overwrite_all=true;;
          b )
            backup=true;;
          B )
            backup_all=true;;
          s )
            skip=true;;
          S )
            skip_all=true;;
          * )
            ;;
        esac

      fi

    fi

    overwrite=${overwrite:-$overwrite_all}
    backup=${backup:-$backup_all}
    skip=${skip:-$skip_all}

    if [ "$overwrite" == "true" ]
    then
      rm -rf "$dst"
      success "removed $dst"
    fi

    if [ "$backup" == "true" ]
    then
      mv "$dst" "${dst}.backup"
      success "moved $dst to ${dst}.backup"
    fi

    if [ "$skip" == "true" ]
    then
      success "skipped $src"
    fi
  fi

  if [ "$skip" != "true" ]  # "false" or empty
  then
    ln -s "$1" "$2"
    success "linked $1 to $2"
  fi
}

install_dotfiles () {
  info 'installing dotfiles'

  local overwrite_all=false backup_all=false skip_all=false

  for src in $(find -H "$DOTFILES_ROOT" -maxdepth 2 -name '*.symlink' -not -path '*.git*')
  do
    dst="$HOME/.$(basename "${src%.*}")"
    link_file "$src" "$dst"
  done
}

install_oh_my_zsh () {
  info "Installing oh-my-zsh"

  if [ ! -d ~/.oh-my-zsh ]
  then
    echo "Installing oh-my-zsh..."
    wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
    sh install.sh --unattended
    rm install.sh
  else
    echo "Omitting oh-my-zsh installation - oh-my-zsh already installed!"
  fi
}

install_plugins () {
  info() {
    echo "[INFO] $1"
  }

  clone_plugin_if_not_exists() {
    local plugin_url=$1
    local plugin_dir=$2
    if [ ! -d "$plugin_dir" ]; then
      git clone "$plugin_url" "$plugin_dir"
      info "Cloned $plugin_url into $plugin_dir"
    else
      info "$plugin_dir already exists"
    fi
  }

  install_brew_package() {
    local package_name=$1
    if ! brew list | grep -q "$package_name"; then
      brew install "$package_name"
      info "Installed $package_name"
    else
      info "$package_name already installed"
    fi
  }

  info "Installing plugins"

  # Ensure $ZSH_CUSTOM is set to a valid directory
  ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}

  # Create the custom plugins directory if it doesn't exist
  mkdir -p $ZSH_CUSTOM/plugins

  # Install Homebrew packages
  install_brew_package "zsh-syntax-highlighting"
  install_brew_package "zsh-autosuggestions"

  # Clone plugins if they don't exist
  clone_plugin_if_not_exists "https://github.com/zsh-users/zsh-syntax-highlighting.git" "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
  clone_plugin_if_not_exists "https://github.com/zsh-users/zsh-autosuggestions" "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
  clone_plugin_if_not_exists "https://github.com/supercrabtree/k" "$ZSH_CUSTOM/plugins/k"
}

install_theme () {
  info "Downloading theme..."
  git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
}

create_local_files () { 
  if [ ! -f "$HOME/.zshenv_local" ]; then
    touch "$HOME/.zshenv_local"
  fi 
  if [ ! -f "$HOME/.local-functions" ]; then
    touch "$HOME/.local-functions"
  fi 

}

install_dependencies () {
  info 'Checking and installing dependencies'

  # Check if brew is installed
  if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  # List of dependencies
  dependencies=("wget" "git")

  for dep in "${dependencies[@]}"; do
    if ! command -v $dep &> /dev/null; then
      echo "$dep not found. Installing $dep..."
      brew install $dep
    else
      echo "$dep is already installed."
    fi
  done

  success 'All dependencies installed'
}

install_dependencies
install_oh_my_zsh
install_dotfiles
install_plugins
install_theme
create_local_files

echo '  All installed!'
