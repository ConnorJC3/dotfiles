# Themes
ZSH_THEME="agnoster"

# Case-sensitive completion
CASE_SENSITIVE="true"

# History
HIST_STAMPS="yyyy-mm-dd"

# Plugins
plugins=(
    archive
    extract
    git
)

# Environment variables
source ~/.exports

# Oh My Zsh
source ~/.oh-my-zsh/oh-my-zsh.sh

# dircolors
if [ -x "$(command -v dircolors)" ]; then
    eval "$(dircolors -b ~/.dircolors)"
fi
