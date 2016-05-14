
# Put my perl scripts in my PATH.
if [ -d "$HOME/perl" ] ; then
    PATH="$HOME/perl:$PATH"
fi

# Add my perl lib to PERL5LIB.
if [ -d "$HOME/perl/lib" ] ; then
	PERL5LIB="${PERL5LIB:+"$PERL5LIB:"}$HOME/perl/lib"
	export PERL5LIB
fi

# Enable plenv.
if [ -d "$HOME/.plenv/bin" ] ; then
    PATH="$HOME/.plenv/bin:$PATH"
	eval "$(plenv init -)"
fi

# This is for my Perl modules in ~/perl5 (local::lib)
#PERL_MB_OPT="--install_base \"/home/tim/perl5\""; export PERL_MB_OPT;
#PERL_MM_OPT="INSTALL_BASE=/home/tim/perl5"; export PERL_MM_OPT;
#MANPATH="$HOME/perl5/man:$MANPATH"; export MANPATH;
# Note: This does not play well with plenv!

# Enable Rakudobrew
if [ -d "$HOME/.rakudobrew/bin" ] ; then
    PATH="$HOME/.rakudobrew/bin:$PATH"
	export PATH
fi
