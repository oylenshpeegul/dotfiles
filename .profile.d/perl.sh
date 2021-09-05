# Put my perl scripts in my PATH.
if [ -d "$HOME/perl" ] ; then
    PATH="$HOME/perl:$PATH"
fi

# Add my perl lib to PERL5LIB.
if [ -d "$HOME/perl/lib" ] ; then
	PERL5LIB="${PERL5LIB:+"$PERL5LIB:"}$HOME/perl/lib"
	export PERL5LIB
fi

# Use cpanm to install modules in ~/perl5  with local::lib.
# wget -O- http://cpanmin.us | perl - -l ~/perl5 App::cpanminus local::lib
eval `perl -I ~/perl5/lib/perl5 -Mlocal::lib`
MANPATH="$HOME/perl5/man:$MANPATH"
export MANPATH

# Make cpanm use https.
# https://twitter.com/perlbuzz/status/1321813741898530818
PERL_CPANM_OPT="-M https://cpan.metacpan.org/"
export PERL_CPANM_OPT


# # Enable plenv.
# if [ -d "$HOME/.plenv/bin" ] ; then
#     PATH="$HOME/.plenv/bin:$PATH"
# 	eval "$(plenv init -)"
# fi

# # Enable Rakudobrew
# if [ -d "$HOME/.rakudobrew/bin" ] ; then
#     PATH="$HOME/.rakudobrew/bin:$PATH"
# 	export PATH
# fi
