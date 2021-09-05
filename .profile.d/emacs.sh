# Add Cask to my PATH.
if [ -d "$HOME/.cask/bin" ] ; then
    PATH="$PATH:.cask/bin"
fi

# With this set, emacsclient -c/-t will start an Emacs daemon if there
# isn't one already running. No need to start gnu server manually.
ALTERNATE_EDITOR=""
export ALTERNATE_EDITOR
