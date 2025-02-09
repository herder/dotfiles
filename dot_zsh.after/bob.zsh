if type bob >/dev/null 2>&1; then
	if [ ! -f ~/.zfunc/_bob ] ; then
		eval $(bob complete zsh) > ~/.zfunc/_bob
	fi
fi
PATH=$HOME/.local/share/bob/nvim-bin:$PATH
