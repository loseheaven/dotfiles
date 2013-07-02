if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

#if [ -f ~/.git-prompt.sh ]; then
  #source ~/.git-prompt.sh
  #PS1="[\u@RMBP:\w\[\033[0;32m\]$(__git_ps1 "(%s)")\[\033[1;37m\]]\$ "
#fi

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

PROMPT_COMMAND=show_git_branch

alias la='ls -a'
alias ll='ls -al'
