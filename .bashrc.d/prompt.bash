
# # Fancy two-line prompt
# export PS1="\n${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\]\n\$ "

if [ $TERM = 'linux' -a $SHELL = '/bin/bash' ] ; then
    # Turn off blinking cursor in virtual consoles
    export PS1="\033[?17;0;127c$PS1"
else
    # Set the window title in X terminals
    export PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
fi

# Use starship for a prompt (https://starship.rs/)
# Its configuration is in ~/.config/starship.toml
eval "$(starship init bash)"

# https://starship.rs/advanced-config/#change-window-title
function set_win_title(){
    echo -ne "\033]0; $PWD \007"
}
starship_precmd_user_func="set_win_title"
