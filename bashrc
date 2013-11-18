#!/bin/bash
## 
# Tips and Ticks... from http://www.caliban.org/bash/index.shtml 
## 
# 
# HISTIGNORE="&:l:ls:ls *:l *:cd:cd *:[bf]g:exit:quit:q:sleep *"
        # History ignores commands that include any l/ls/cd etc
        # This kicks-ass! It drops repeats and other useless 
        # things from the command history! 
 HISTIGNORE="&:l:ls:ls *:l *:cd:cd *:[bf]g:exit:quit:q:sleep *" 
        # I want to see l/ls/cd in my history
 HISTCONTROL=ignoreboth
        # ignores both commands that start with a space or a tab, and duplicates
        # other options are as follows:
        # `ignorespace' means to not enter lines which begin with a space or tab into the history list.
        # `ignoredups' means to not enter lines which match the last entered line.
        # `ignoreboth' combines the two options.
export HISTSIZE=10000

# Spell check for 'cd', extended globbing, programmable completion 
shopt -s cdspell extglob progcomp histappend 

# Bash completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

## 
# Set the prompt
## 
PS1="[\h:\w] \[\033[1;34m\]\u\[\033[0m\]\\$ " 
        # My prompt line:       "[gaelicWizard:~/Documents] user$ " user is in blue 
        # Or:                   "[gaelicWizard:~/Documents] root# " root is in blue 

PROMPT_COMMAND='echo -ne "\033]0;${USER} on ${HOSTNAME} at ${PWD}\007" && history -a'
