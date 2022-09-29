# $PATH additions
if [ -x "$(command -v yarn)" ]; then
  export PATH=$PATH:$(yarn global bin)
fi
export PATH=$HOME/.local/bin:$PATH

# aliases and functions
alias ls="ls --color=auto"
alias fly="fly --target=realliance"

# rbenv
if [ -x "$(command -v rbenv)" ]; then
  eval "$(rbenv init -)"
fi

# zsh options (these will NOT work in .zshenv)
export HISTFILE="${HOME}/.zsh_history"
export HISTSIZE=100000
export SAVEHIST=${HISTSIZE}
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt MENU_COMPLETE
setopt NO_AUTO_LIST

# better up/down arrow searching
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search
bindkey "^[OA" up-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search

# beginning/end of line bindings
bindkey "^a" beginning-of-line
bindkey "^e" end-of-line

# plugin options
export ZSH_AUTOSUGGEST_STRATEGY=(completion)
export ZSH_AUTOSUGGEST_MANUAL_REBIND=1
export ZSH_AUTOSUGGEST_USE_ASYNC=1

# prompt options
export SPACESHIP_ASYNC_SHOW=false
export SPACESHIP_CHAR_SYMBOL="$ "
export SPACESHIP_CHAR_SYMBOL_ROOT="# "
export SPACESHIP_PROMPT_SEPARATE_LINE=false
export SPACESHIP_VI_MODE_SHOW=false
export SPACESHIP_EXEC_TIME_SHOW=false
export SPACESHIP_BATTERY_SHOW=false
export SPACESHIP_DOCKER_SHOW=false
export SPACESHIP_DOCKER_CONTEXT_SHOW=false
export SPACESHIP_PACKAGE_SHOW=false
export SPACESHIP_GRADLE_JVM_SHOW=false
export SPACESHIP_GIT_STATUS_COLOR="yellow"
export SPACESHIP_GIT_STATUS_RENAMED="!"
export SPACESHIP_GIT_STATUS_DELETED="X"
export SPACESHIP_GIT_STATUS_AHEAD=""
export SPACESHIP_GIT_STATUS_BEHIND=""
export SPACESHIP_GIT_STATUS_DIVERGED=""
export SPACESHIP_GIT_STATUS_PREFIX="["
export SPACESHIP_GIT_STATUS_SUFFIX="]"

export SPACESHIP_DIR_LOCK_SYMBOL="[ro]"
export SPACESHIP_GIT_SYMBOL=""
export SPACESHIP_NODE_SYMBOL="node "
export SPACESHIP_RUBY_SYMBOL="ruby "
export SPACESHIP_ELM_SYMBOL="elm "
export SPACESHIP_ELIXIR_SYMBOL="exlixir "
export SPACESHIP_SWIFT_SYMBOL="swift "
export SPACESHIP_GOLANG_SYMBOL="go "
export SPACESHIP_PHP_SYMBOL="php "
export SPACESHIP_RUST_SYMBOL="rust "
export SPACESHIP_HASKELL_SYMBOL="haskell "
export SPACESHIP_JULIA_SYMBOL="julia "
export SPACESHIP_AWS_SYMBOL="aws "
export SPACESHIP_GCLOUD_SYMBOL="gcp "
export SPACESHIP_PYTHON_SYMBOL="python "
export SPACESHIP_EMBER_SYMBOL="ember "
export SPACESHIP_KUBECTL_SYMBOL="k8s "
export SPACESHIP_TERRAFORM_SYMBOL="terraform "
export SPACESHIP_GRADLE_SYMBOL="gradle "

# zi installer
if [[ ! -f $HOME/.zi/bin/zi.zsh ]]; then
  command mkdir -p "$HOME/.zi" > /dev/null && command chmod g-rwx "$HOME/.zi" > /dev/null
  command git clone https://github.com/z-shell/zi "$HOME/.zi/bin" &> /dev/null || echo "Failed to clone zi!"
fi
source "$HOME/.zi/bin/zi.zsh"
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi

# prompt (sync load)
zi light denysdovhan/spaceship-prompt

# plugins (async load)
zi wait"0" lucid for \
  atinit"zicompinit; zicdreplay" \
    z-shell/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions \
  blockf atpull"zi creinstall -q ." \
    zsh-users/zsh-completions \
  atclone"dircolors -b LS_COLORS > clrs.zsh" atpull"%atclone" pick"clrs.zsh" nocompile"!" \
    trapd00r/LS_COLORS

# Start ssh-agent if not running
ssh-add -l &>/dev/null
if [ $? -eq 2 ]; then
  ssh-agent -a ${SSH_AUTH_SOCK} &>/dev/null
fi

# Add identities to ssh-agent if none
ssh-add -l &>/dev/null
if [ $? -eq 1 ]; then
  ssh-add &> /dev/null
fi

# Source machine-specific zshrc if it exists
if [[ -f "${HOME}/.zshrc-extra" ]]; then
  source "${HOME}/.zshrc-extra"
fi
