use str
use path
use file
use platform

use github.com/zzamboni/elvish-completions/cd
use github.com/zzamboni/elvish-completions/git
use github.com/zzamboni/elvish-completions/ssh
use github.com/zzamboni/elvish-completions/dd

use github.com/aca/elvish-bash-completion/bash-completer

use github.com/zzamboni/elvish-modules/iterm2

set edit:insert:binding[Alt-Backspace] = $edit:kill-small-word-left~
set edit:insert:binding[Alt-Delete] = $edit:kill-small-word-right~

set edit:insert:binding[Alt-Left] = $edit:move-dot-left-small-word~
set edit:insert:binding[Alt-Right] = $edit:move-dot-right-small-word~

set edit:insert:binding[Alt-Shift-Backspace] = $edit:kill-word-left~
set edit:insert:binding[Alt-Shift-Delete] = $edit:kill-word-right~

set edit:insert:binding[Alt-Shift-Left] = $edit:move-dot-left-word~
set edit:insert:binding[Alt-Shift-Right] = $edit:move-dot-right-word~

if (has-external plink.exe) {
	set-env GIT_SSH 'plink.exe'
}

var completion_path = /opt/homebrew/etc/bash_completion.d/

if ?(test -d $completion_path) {
	for item [(ls $completion_path)] {
		if (not ?(test -f $completion_path/$item)) { continue }
		if (has-key $edit:completion:arg-completer $item) { continue }
		if ?(grep -q "complete -o default -F __start" $completion_path/$item) {
			set edit:completion:arg-completer[$item] = (bash-completer:new $item &bash_function="__start_"$item)
		} else {
			set edit:completion:arg-completer[$item] = (bash-completer:new $item)
		}
	}
}

var null = "/dev/null"
if $platform:is-windows {
	set null = "NUL"
}	

var have_colour_ls = ?(ls --color >$null 2>$null)
if $have_colour_ls {
	edit:add-var "ls~" {|@a| e:ls --color $@a }
}

var has_home_bin = $false
for path $paths {
	if (==s (path:abs $path) (path:abs "~/bin")) {
		set has_home_bin = $true
	}
}
if (not $has_home_bin) {
	set paths = [~/bin $@paths]
}

# Import ~/.config/elvish/rc-local.elv in the current scope if it exists, drop error message.
var f
if ?(set f = (file:open ~/.config/elvish/rc-local.elv)) {
	eval (slurp <$f)
	file:close $f
}

iterm2:init

