
# Configure Go
if [ -d "/usr/local/go/bin" ] ; then
    PATH="/usr/local/go/bin:$PATH"
fi

# Let's try making my home directory the gopath!
GOPATH=$HOME
export GOPATH



