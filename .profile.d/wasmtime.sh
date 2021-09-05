if [ -d "$HOME/.wasmtime/bin" ] ; then
    WASMTIME_HOME="$HOME/.wasmtime"
    export WASMTIME_HOME
    PATH="$PATH:$WASMTIME_HOME/bin"
fi
