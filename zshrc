# aliases
alias ls="ls --color=auto"
alias docker="podman"

# rbenv
if [ -x "$(command -v rvenv)" ]; then
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

# beginning/end of line bindings
bindkey "^a" beginning-of-line
bindkey "^e" end-of-line

# plugin options
export ZSH_AUTOSUGGEST_STRATEGY=(completion)
export ZSH_AUTOSUGGEST_MANUAL_REBIND=1
export ZSH_AUTOSUGGEST_USE_ASYNC=1
export _ZL_MATCH_MODE=1
export _ZL_HYPHEN=1
export _ZL_ADD_ONCE=1

# prompt options
export SPACESHIP_CHAR_SYMBOL="$ "
export SPACESHIP_CHAR_SYMBOL_ROOT="# "
export SPACESHIP_PROMPT_SEPARATE_LINE=false
export SPACESHIP_VI_MODE_SHOW=false
export SPACESHIP_EXEC_TIME_SHOW=false
export SPACESHIP_BATTERY_SHOW=false
export SPACESHIP_DOCKER_SHOW=false
export SPACESHIP_DOCKER_CONTEXT_SHOW=false
export SPACESHIP_PACKAGE_SHOW=false
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
export SPACESHIP_PYENV_SYMBOL="python "
export SPACESHIP_EMBER_SYMBOL="ember "
export SPACESHIP_KUBECTL_SYMBOL="k8s "
export SPACESHIP_TERRAFORM_SYMBOL="terraform "

# zinit installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
  command mkdir -p "$HOME/.zinit" > /dev/null && command chmod g-rwx "$HOME/.zinit" > /dev/null
  command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" &> /dev/null || echo "Failed to clone zinit!"
fi
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# prompt (sync load)
zinit light denysdovhan/spaceship-prompt

# plugins we want loaded asap (mostly visual stuff)
zinit wait"0" lucid for \
  skywind3000/z.lua \
  atinit"zicompinit; zicdreplay" \
    zdharma/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions \
  blockf atpull"zinit creinstall -q ." \
    zsh-users/zsh-completions \
  atclone"dircolors -b LS_COLORS > clrs.zsh" atpull"%atclone" pick"clrs.zsh" nocompile"!" \
    trapd00r/LS_COLORS

# plugins we don't care about for a long time
zinit wait"1" lucid for \
  gusaiani/elixir-oh-my-zsh \
  wfxr/forgit
