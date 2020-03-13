## 
# Environment... 
## 

## PATH 
set PATH /usr/local/bin /usr/local/sbin /usr/sbin /usr/bin /sbin /bin
set MANPATH /usr/local/share/man /usr/share/man

# Set up some variables for 'screen'
if test -d $HOME/.screen
    set -x SCREENDIR $HOME/.screen
end

if which code > /dev/null
    set -x EDITOR code -w
else
    set -x EDITOR vim
end


# OS X Homebrew specific
if which brew > /dev/null
    if which go > /dev/null
        set -x GOPATH (brew --prefix)/share/go
    end
end

# Python related
# for script compilation
set -x ARCHFLAGS "-arch i386 -arch x86_64"

# pyenv
if which pyenv > /dev/null; and status --is-interactive
    . (pyenv init -|psub)
end

# virtualfish
eval (python3 -m virtualfish auto_activation)

if which rbenv > /dev/null; and status --is-interactive
    source (rbenv init -|psub)
end

# Shell autocomplete
if test -e $HOME/.pythonrc.py
    set -x PYTHONSTARTUP $HOME/.pythonrc.py
end

# Source any API access keys
if test -e $HOME/.config/fish/api_keys.fish
    source $HOME/.config/fish/api_keys.fish
end

# Iterm2 integration
if test "$TERM_PROGRAM" = "iTerm.app"; and test -e {$HOME}/.iterm2_shell_integration.fish
    source {$HOME}/.iterm2_shell_integration.fish
end
