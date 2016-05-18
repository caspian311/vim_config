#!/bin/bash

PS1='\h:\W \u\$ '
# Make bash check its window size after a process completes
shopt -s checkwinsize

[ -r "/etc/bashrc_$TERM_PROGRAM" ] && . "/etc/bashrc_$TERM_PROGRAM"

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# file/dir
alias ll='ls -l'
alias la='ls -la'
alias ltr='ls -ltr'
alias latr='ls -latr'

# git
alias gp='git push origin HEAD -u'

# ruby
alias bi='bundle install'

function be() {
   bundle exec $@
}

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export PATH="./bin:$PATH" # give binstubs precedence over rbenv shims

[ -f ~/.git_bash_prompt.bash ] &&  source ~/.git_bash_prompt.bash


