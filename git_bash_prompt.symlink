#!/bin/bash
#
# Set our bash prompt according to the branch/status of the current git
# repository.
#
# Taken from http://gist.github.com/31934

        RED="\[\e[0;31m\]"
      GREEN="\[\e[0;32m\]"
     YELLOW="\[\e[0;33m\]"
       BLUE="\[\e[0;34m\]"
    MAGENTA="\[\e[0;35m\]"
       CYAN="\[\e[0;36m\]"
       GRAY="\[\e[0;37m\]"
   DIM_GRAY="\[\e[38;5;245m\]"
  LIGHT_RED="\[\e[1;31m\]"
LIGHT_GREEN="\[\e[1;32m\]"
LIGHT_YELLOW="\[\e[1;33m\]"
 LIGHT_BLUE="\[\e[1;34m\]"
LIGHT_MAGENTA="\[\e[1;35m\]"
 LIGHT_CYAN="\[\e[1;36m\]"
      WHITE="\[\e[1;37m\]"
 COLOR_NONE="\[\e[0m\]"

function is_git_repository {
 git branch > /dev/null 2>&1
}

function parse_git_branch {
 # Only display git info if we're inside a git repository.
 is_git_repository || return 1

 # Capture the output of the "git status" command.
 git_status="$(git status 2> /dev/null)"
 git_stash="$(git stash list 2> /dev/null)"
 # Set color based on clean/staged/dirty.
 if [[ ${git_status} =~ "working directory clean" ]]; then
   state="${GREEN}"
 elif [[ ${git_status} =~ "Changes to be committed" ]]; then
   state="${YELLOW}"
 else
   state="${RED}"
 fi
 if [[ -n ${git_stash} ]]; then
   stash="${MAGENTA} stashed"
 fi

 # Set arrow icon based on status against remote.
 if [[ ${git_status} =~ "Your branch is ahead" ]]; then
   remote="↑"
 elif [[ ${git_status} =~ "Your branch is behind" ]]; then
   remote="↓"
 elif [[ ${git_status} =~ ' have diverged' ]]; then
   remote="↔"
 fi

 # Get the name of the branch.
 branch_pattern="^(# )?On branch"
 if [[ ${git_status} =~ ${branch_pattern} ]]; then
   branch="($(git symbolic-ref -q HEAD | sed -e 's|^refs/heads/||'))"
 else
   branch="{Detached HEAD}"
 fi

 # Display the prompt.
 echo "${state}${branch}${remote}${stash}${COLOR_NONE}"
}

function prompt_symbol () {
 # Set color of dollar prompt based on return value of previous command.
 if test $1 -eq 0
 then
     echo "\$"
 else
     echo "${RED}\$${COLOR_NONE}"
 fi
}

function iterate_through_gems {
  DIRECTORY=$(git rev-parse --show-toplevel 2> /dev/null)/.local_gems
  if [ -d "$DIRECTORY" ]; then
    SUBDIRS=$(find $DIRECTORY* -maxdepth 1 -type l | wc -l)
    if [ $SUBDIRS -ne 0 ]; then
      for gem in $(git rev-parse --show-toplevel 2> /dev/null)/.local_gems/*; do
      cd "$gem"
      echo "${BLUE}${PWD##*/}:${COLOR_NONE} $(parse_git_branch)" | tr '\n' ' '""
      done
    fi
  fi
}

function prompt_func () {
 last_return_value=$?
 if [ -z "$SSH_CONNECTION" ]; then
   host_info="${DIM_GRAY}@${COLOR_NONE}\h"
 else
   from_ip=$(echo $SSH_CONNECTION | cut -d' ' -f1 | tr -d '\n')
   host_info="${DIM_GRAY}@${MAGENTA}\h ${DIM_GRAY}(via $from_ip)"
 fi
 PS1="\u:${host_info}:${YELLOW}\w${COLOR_NONE} $(parse_git_branch) $(iterate_through_gems)\n$(prompt_symbol $last_return_value) "
 echo -n -e "\033]0;$USER@$HOSTNAME:$PWD\007\n"
}

PROMPT_COMMAND=prompt_func


