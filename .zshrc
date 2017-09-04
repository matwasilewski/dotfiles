ZSH_THEME="spaceship"
SPACESHIP_PROMPT_SYMBOL="❯"
SPACESHIP_PACKAGE_SHOW=false
SPACESHIP_BATTERY_SHOW=false
SPACESHIP_BATTERY_ALWAYS_SHOW=false
# --- Plugins

plugins=(git sudo zsh-syntax-highlighting zsh-autosuggestions)

# --- Source 
source $ZSH/oh-my-zsh.sh
source $HOME/.functions
source $HOME/.aliases
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source "/Users/jesperorb/.oh-my-zsh/custom/themes/spaceship.zsh-theme"
