if [ -d "$HOME/.cargo/bin" ] ; then
    PATH="$PATH:$HOME/.cargo/bin"
fi

CARGO_TARGET_DIR=$HOME/rust/target
export CARGO_TARGET_DIR

