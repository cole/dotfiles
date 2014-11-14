## 
# Environment... 
## 

## PATH 
set PATH /usr/local/bin /usr/local/sbin /usr/sbin /usr/bin /sbin /bin
set MANPATH /usr/local/share/man /usr/share/man

# Add the scripts folder
if test -d $HOME/Documents/Scripts
    set PATH $PATH $HOME/Documents/Scripts
end

# Set up some variables for 'screen'
if test -d $HOME/.screen
    set SCREENDIR $HOME/.screen
end

if which mate > /dev/null
    set EDITOR mate
else
    set EDITOR vim
end


# OS X Homebrew specific
if which brew > /dev/null
    # Go ENV
    if which go > /dev/null
        set GOPATH (brew --prefix)/share/go
    end
end

# Python related
# for script compilation
set ARCHFLAGS "-arch i386 -arch x86_64"
# Shell autocomplete
if test -e $HOME/.pystartup
set PYTHONSTARTUP $HOME/.pystartup
end

# Add NPM global packages bin folder
if which npm > /dev/null
set PATH $PATH (npm -g bin)
end

# rbenv
if which rbenv > /dev/null
    set PATH $HOME/.rbenv/bin $PATH
    set PATH $HOME/.rbenv/shims $PATH
    rbenv rehash >/dev/null ^&1
end

# Source any API access keys
if test -e $HOME/.config/fish/api_keys.fish
    source $HOME/.config/fish/api_keys.fish
end
