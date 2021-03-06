# Add auto-completion and a stored history file of commands to your Python
# interactive interpreter. Requires Python 2.0+, readline. Autocomplete is
# bound to the Tab key (you can change it - see readline docs).
#
# Store the file in ~/.pythonrc.py, and set an environment variable to point
# to it:  "export PYTHONSTARTUP=/home/user/.pythonrc.py" in bash.
#
# Note that PYTHONSTARTUP does *not* expand "~", so you have to put in the
# full path to your home directory.
import sys
if sys.version_info[0] == 2:
    import atexit
    import os
    import readline
    import rlcompleter

    readline.parse_and_bind('tab: complete')
    historyPath = os.path.expanduser("~/.pyhistory")

    def save_history(historyPath=historyPath):
        import readline
        readline.write_history_file(historyPath)

    if os.path.exists(historyPath):
        try:
            readline.read_history_file(historyPath)
        except IOError:
            pass

    atexit.register(save_history)
    del os, atexit, readline, rlcompleter, save_history, historyPath
