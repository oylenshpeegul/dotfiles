
# Put my Python scripts in my PATH.
if [ -d "$HOME/python" ] ; then
    PATH="$HOME/python:$PATH"
fi

# Enable pyenv.
if [ -d "$HOME/.pyenv/bin" ] ; then
    PATH="$HOME/.pyenv/bin:$PATH"
	eval "$(pyenv init -)"
fi

