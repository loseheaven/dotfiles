autoload -Uz compinit
compinit

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# if [ -f ~/.git-prompt.sh ]; then
#   source ~/.git-prompt.sh
# fi

if brew list | grep coreutils > /dev/null ; then
  PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
  alias ls='ls --show-control-chars --color=auto'
  eval `gdircolors -b $HOME/.dir_colors`
fi

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function show_git_branch {
  PS1="\u@RMBP:\w\[\e[0;32m\]$(parse_git_branch)\[\e[0m\]\$ "
}

# bash
# PROMPT_COMMAND=show_git_branch

# zsh
precmd () { PS1="%n@mbp %c%F{green}$(parse_git_branch)%f %# " }

alias la='ls -a'
alias ll='ls -al'
