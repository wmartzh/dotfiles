# If you come from bash you might have to change your $PATH.

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

## THEME
ZSH_THEME="robbyrussell"

eval "$(oh-my-posh init zsh --config ~/ohmyposh/theme.omp.json)"


#pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

# command auto-correction.
ENABLE_CORRECTION="true"


## Plugins

plugins=(
  git
  bundler
	rake
	aliases
  zoxide
 )

source $ZSH/oh-my-zsh.sh

# User configuration


##################
# Instalations
#################

# bun completions
[ -s "/Users/wmartzh/.bun/_bun" ] && source "/Users/wmartzh/.bun/_bun"


# Smarter completion initialization
autoload -Uz compinit
if [ "$(date +'%j')" != "$(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)" ]; then
    compinit
else
    compinit -C
fi




# Aliases

# Custom functions

# Change git credentials
changeGitCredentials() {
  local name="$1"
  local email="$2"
  git config --global --unset user.name
  git config --global --unset user.email

  if git config --global user.name "$name" --replace-all && git config --global user.email "$email" --replace-all; then
    echo "Git credentials updated to: Name='$name', Email='$email'"
  else
    echo "Error updating Git credentials."
  fi
}


alias zs='source ~/.zshrc'
alias g-q6='changeGitCredentials "Wilian Martinez" "wmartinez@q6cyber.com"'
alias g-wm='changeGitCredentials "Wilian Martinez" "wmartzh@gmail.com"'
### tmux
alias tx='tmux'
alias tx-n='tmux new -s'
alias tx-a='tmux attach -t'
alias tx-ls='tmux ls'
alias tx-rm="tmux kill-session -t"
## eza
alias ls='eza --icons -1 -G'
alias la='eza --icons -l -a'
alias lsg='ls -G'


# ENVIRONMENT

# EZA
export EZA_CONFIG_DIR="$HOME/.config/eza"

# NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Sign Commits = enable (Gnu Privacy Guard)
export GPG_TTY=$(tty)

#Go
# export GO="$HOME/go/bin"
# bun
export BUN_INSTALL="$HOME/.bun"
export GO="$HOME/go/bin"
export PATH="$BUN_INSTALL/bin:$GO:$PATH"





export DVM_DIR="/Users/wmartzh/.dvm"
export PATH="$DVM_DIR/bin:$PATH"
# opencode
export PATH=/Users/wmartzh/.opencode/bin:$PATH

# qlty completions
[ -s "/opt/homebrew/share/zsh/site-functions/_qlty" ] && source "/opt/homebrew/share/zsh/site-functions/_qlty"

# qlty
export QLTY_INSTALL="$HOME/.qlty"
export PATH="$QLTY_INSTALL/bin:$PATH"


# Autoload env
autoload -U add-zsh-hook
load-nvmrc() {
  # Define the specific parent directory
  local target_root="$HOME/projects"

  # Check if the current directory is a child of target_root
  if [[ "$PWD" == "$target_root"* ]]; then
    local nvmrc_path="$(nvm_find_nvmrc)"

    if [ -n "$nvmrc_path" ]; then
      local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

      if [ "$nvmrc_node_version" = "N/A" ]; then
        nvm install
      elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
        nvm use
      fi
    elif [ "$(nvm version)" != "$(nvm version default)" ]; then
      nvm use default
    fi
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

