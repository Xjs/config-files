alias tip="git --no-pager log -1 --oneline --no-abbrev"

export GPGHOME=~/.gnupg/
export GNUPGHOME=~/.gnupg/

if [ -f "$HOME/.alias" ]; then
	source $HOME/.alias
fi
