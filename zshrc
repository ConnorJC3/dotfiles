# $PATH additions
export PATH="${HOME}/.local/bin/:${PATH}"
export PATH="${HOME}/.arkade/bin/:${PATH}"

# aliases and functions
alias ls="ls --color=auto"

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
if [[ ! -f "${HOME}/.zi/bin/zi.zsh" ]]; then
  command mkdir -p "${HOME}/.zi" > /dev/null && command chmod g-rwx "${HOME}/.zi" > /dev/null
  command git clone https://github.com/z-shell/zi "${HOME}/.zi/bin" &> /dev/null || echo "Failed to clone zi!"
fi
typeset -Ag ZI
ZI[BIN_DIR]="${HOME}/.zi/bin"
source "${ZI[BIN_DIR]}/zi.zsh"
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi

# prompt (sync)
zi light denysdovhan/spaceship-prompt

# annexes (sync)
zi light-mode for \
  z-shell/z-a-eval

# github releases (async)
zi wait"0a" from"gh-r" as"program" lucid for \
  pick"arkade" eval"arkade completion zsh" \
    alexellis/arkade \
  mv"jq* -> jq" pick"jq" \
    stedolan/jq \
  mv"yq* -> yq" pick"yq" \
    mikefarah/yq

# arkade tools (async)
zi wait"0b" atpull"%atclone" run-atpull has"arkade" lucid for \
  id-as"kubectl" atclone"arkade get kubectl" eval"kubectl completion zsh" z-shell/null \
  id-as"clusterctl" atclone"arkade get clusterctl" eval"clusterctl completion zsh" z-shell/null \
  id-as"kind" atclone"arkade get kind" eval"kind completion zsh" z-shell/null \
  id-as"kubectx" atclone"arkade get kubectx" z-shell/null \
  id-as"kubens" atclone"arkade get kubens" z-shell/null \
  id-as"talosctl" atclone"arkade get talosctl" eval"talosctl completion zsh" z-shell/null

# external completions (async)
zi wait"0b" as"completion" lucid for \
  zsh-users/zsh-completions \
  pick"completion/_kubectx.zsh" ahmetb/kubectx \
  pick"completion/_kubens.zsh" ahmetb/kubectx

# plugins (async)
zi wait"0c" lucid for \
  eval"dircolors -b LS_COLORS" \
    trapd00r/LS_COLORS

# special plugins (async)
# These MUST be loaded AFTER anything that adds completions
# Put all completions in wait"0b" or earlier!
zi wait"0c" lucid for \
  atinit"zicompinit; zicdreplay" \
    z-shell/F-Sy-H \
  atload"_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions \

if [[ "${+commands[ssh-add]}" == 1 ]] && [[ "${+commands[ssh-agent]}" == 1 ]]; then
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
fi

# Source machine-specific zshrc if it exists
if [[ -f "${HOME}/.zshrc-extra" ]]; then
  source "${HOME}/.zshrc-extra"
fi
