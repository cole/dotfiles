## 
# Environment... 
## 

## PATH 
PATH="/usr/local/bin:/usr/local/sbin:/usr/sbin:/usr/bin:/sbin:/bin"
export MANPATH="/usr/local/share/man:/usr/share/man"

# If we have a scripts folder, add it
if [ -d ~/Documents/Scripts ]; then
    PATH="$PATH:~/Documents/Scripts"
fi

# Set up some variables for 'screen' 
if [ -z "${SCREENDIR}" ];then echo -n
    # Save my screen sockets within my $HOME dir
    export SCREENDIR="${HOME}/.screen" 
fi 

# Set $TERM to 'vt100' (a safe default) if, for some 
# reason, it is set to 'network' (which is not valid!) 
if [ "${TERM}" = "network" ];then echo -n
    # not 'nsterm' because if its 'network' we're 
    # probly not in Terminal.app
    export TERM="vt100" 
fi 
# Set $COLORTERM, all this does is trick *some* apps into 
# using color in the terminal, which should happen anyway. 
if [ -z "${COLORTERM}" ];then echo -n 
    export COLORTERM="${TERM}" 
fi 
# another color option, this one for BSD's ls 
if [ -z "${CLICOLOR}" ];then echo -n 
    export CLICOLOR='1' # can be set to anything, actually 
fi 
# If $DISPLAY is not already set, set it! 
if [ -z "${DISPLAY}" ];then echo -n 
    export DISPLAY=':0' 
fi 

if which mate > /dev/null; then
    export EDITOR="mate"
fi

# OS X Homebrew specific
if which brew > /dev/null; then
    # Go ENV
    if which go > /dev/null; then
        export GOPATH=`brew --prefix`/share/go
    fi
fi

# Python related
# for script compilation
export ARCHFLAGS="-arch i386 -arch x86_64"
# Shell autocomplete
export PYTHONSTARTUP=~/.pystartup
# Libxml2
if [ -d /usr/local/opt/libxml2/lib/python2.7/site-packages ]; then
    export PYTHONPATH=/usr/local/opt/libxml2/lib/python2.7/site-packages:$PYTHONPATH
fi

# Add NPM global packages bin folder
if which npm > /dev/null; then
    NPM_PATH=`npm -g bin`
    if [[ PATH =~ ^.*$NPM_PATH.* ]]; then
        PATH="${NPM_PATH}:${PATH}"
    fi
fi

# rbenv
if which rbenv > /dev/null; then
    export RBENV_ROOT=/usr/local/var/rbenv
    eval "$(rbenv init -)";
fi

# Source autoenv
if [ -r /usr/local/opt/autoenv/activate.sh ];then echo -n
    source /usr/local/opt/autoenv/activate.sh
fi

# Source any API access keys
if [ -r ~/.api_keys ];then echo -n
    source ~/.api_keys
fi 

export PATH # finally, export PATH