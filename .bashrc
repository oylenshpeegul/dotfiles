
# http://blog.sanctum.geek.nz/shell-config-subfiles/
# Load any supplementary scripts
if [[ -d $HOME/.bashrc.d ]] ; then
	for config in "$HOME"/.bashrc.d/*.bash ; do
		source "$config"
	done
fi
unset -v config
