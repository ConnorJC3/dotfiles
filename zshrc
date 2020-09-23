# dircolors
if [ -x "$(command -v dircolors)" ]; then
  eval "$(dircolors -b ~/.dircolors)"
fi

# rbenv
if [ -x "$(command -v rvenv)" ]; then
  eval "$(rbenv init -)"
fi
