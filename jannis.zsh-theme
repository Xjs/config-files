local host="%{$fg[red]%}%m%{$reset_color%} "
if [[ "$USER" != "root" ]]; then
	local user="%{$fg[yellow]%}$USER%{$reset_color%}@"
	if [[ "$USER" == "jannis" && "$HOST" =~ "Africa" ]]; then
		user=""
		host=""
	fi
	local glyph="$"
else
	local user=""
	host="%{$fg_bold[red]%}%m%{$reset_color%} "
	local glyph="#"
fi
local ret_status="%(?:%{$fg[green]%}${glyph}:%{$fg[red]%}${glyph})%{$reset_color%}"
PROMPT='${user}${host}%{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)${ret_status} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}_"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
