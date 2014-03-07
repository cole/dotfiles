## 
# Environment... 
## 

## PATH 
PATH="/usr/local/bin:/usr/local/sbin:/usr/sbin:/usr/bin:/sbin:/bin:~/Documents/Scripts"
export MANPATH="/usr/local/share/man:/usr/share/man"

# Set up some variables for 'screen' 
if [ -z "${SCREENDIR}" ];then echo -n 
        export SCREENDIR="${HOME}/.screen" 
                # Save my screen sockets within my $HOME dir 
fi 

# Set $TERM to 'vt100' (a safe default) if, for some 
# reason, it is set to 'network' (which is not valid!) 
if [ "${TERM}" = "network" ];then echo -n 
        export TERM="vt100" 
                # not 'nsterm' because if its 'network' we're 
                # probly not in Terminal.app 
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

# PEAR bullshit
PEARPATH="/usr/local/pear"
PATH="${PEARPATH}/bin:${PATH}"

# OS X Homebrew
# Go ENV
export GOROOT=`brew --cellar`/go/HEAD
export GOARCH=amd64
export GOOS=darwin

# for python script compilation
export ARCHFLAGS="-arch i386 -arch x86_64"

# Python shell autocomplete
export PYTHONSTARTUP=~/.pystartup
# Libxml2 for python
export PYTHONPATH=/usr/local/opt/libxml2/lib/python2.7/site-packages:$PYTHONPATH

# Add NPM global packages bin folder
PATH="/usr/local/share/npm/bin:${PATH}"

# rbenv
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export PATH # finally, export PATH
export EDITOR="mate"

# Source autoenv
source /usr/local/opt/autoenv/activate.sh
