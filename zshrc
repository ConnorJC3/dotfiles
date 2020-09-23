# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(root_indicator background_jobs dir_writable time)

# Case-sensitive completion
CASE_SENSITIVE="true"

# History
HIST_STAMPS="yyyy-mm-dd"

# Plugins
plugins=(
    extract
    git
    sudo
    systemd
)

# Environment variables
source ~/.exports

# Oh My Zsh
source ~/.oh-my-zsh/oh-my-zsh.sh

# dircolors
if [ -x "$(command -v dircolors)" ]; then
    eval "$(dircolors -b ~/.dircolors)"
fi

# rbenv
eval "$(rbenv init -)"
