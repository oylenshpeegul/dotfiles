
# Put my Ruby scripts in my PATH.
if [ -d "$HOME/ruby" ] ; then
    PATH="$HOME/ruby:$PATH"
fi

# Enable rbenv.
if [ -d "$HOME/.rbenv/bin" ] ; then
	PATH="$HOME/.rbenv/bin:$PATH"
	eval "$(rbenv init -)"
fi
