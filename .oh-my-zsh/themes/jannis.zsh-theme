local zsh_prompt_host="%{$fg[red]%}%m%{$reset_color%} "
if [[ "$USER" != "root" ]]; then
	if [ -z "$USER" ]; then
		USER="$USERNAME"
	fi
	local zsh_prompt_user="%{$fg[yellow]%}$USER%{$reset_color%}@"
	if [[ "$USER" == "jannis" && "$HOST" =~ "Africa" ]]; then
		zsh_prompt_user=""
		zsh_prompt_host=""
	fi
	local zsh_prompt_glyph="$"
else
	local zsh_prompt_user=""
	zsh_prompt_host="%{$fg_bold[red]%}%m%{$reset_color%} "
	local zsh_prompt_glyph="#"
fi
local zsh_prompt_ret_status="%(?:%{$fg[green]%}${zsh_prompt_glyph}:%{$fg[red]%}${zsh_prompt_glyph})%{$reset_color%}"
PROMPT='${zsh_prompt_user}${zsh_prompt_host}%{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)${zsh_prompt_ret_status} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}_"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
