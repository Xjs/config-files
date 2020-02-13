if [ -z "$ZSH" ]; then
	export ZSH=$HOME/.oh-my-zsh
fi
ZSH_THEME="jannis"
plugins=(git)
source $ZSH/oh-my-zsh.sh

alias tip="git --no-pager log -1 --oneline --no-abbrev"

export GPGHOME=~/.gnupg/
export GNUPGHOME=~/.gnupg/

if [ -f "$HOME/.alias" ]; then
	source $HOME/.alias
fi
