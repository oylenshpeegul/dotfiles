
# Fancy two-line prompt
export PS1="\n${debian_chroot:+($debian_chroot)}\[\033[01;35m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\]\n\$ "

if [ $TERM = 'linux' -a $SHELL = '/bin/bash' ] ; then
	# Turn off blinking cursor in virtual consoles
	export PS1="\033[?17;0;127c$PS1"
else
	# Set the window title in X terminals
	export PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
fi
