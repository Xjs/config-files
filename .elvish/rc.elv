use str
use path

use github.com/zzamboni/elvish-completions/cd
use github.com/zzamboni/elvish-completions/git
use github.com/zzamboni/elvish-completions/ssh

set edit:insert:binding[Alt-Backspace] = $edit:kill-small-word-left~
set edit:insert:binding[Alt-Delete] = $edit:kill-small-word-right~
set edit:insert:binding[Ctrl-Backspace] = $edit:kill-small-word-left~
set edit:insert:binding[Ctrl-Delete] = $edit:kill-small-word-right~

set edit:insert:binding[Ctrl-Left] = $edit:move-dot-left-small-word~
set edit:insert:binding[Ctrl-Right] = $edit:move-dot-right-small-word~
set edit:insert:binding[Alt-Left] = $edit:move-dot-left-small-word~
set edit:insert:binding[Alt-Right] = $edit:move-dot-right-small-word~

set edit:insert:binding[Ctrl-Alt-Backspace] = $edit:kill-word-left~
set edit:insert:binding[Ctrl-Alt-Delete] = $edit:kill-word-right~
set edit:insert:binding[Alt-Shift-Backspace] = $edit:kill-word-left~
set edit:insert:binding[Alt-Shift-Delete] = $edit:kill-word-right~
set edit:insert:binding[Ctrl-Alt-Left] = $edit:move-dot-left-word~
set edit:insert:binding[Ctrl-Alt-Right] = $edit:move-dot-right-word~

if (has-external plink.exe) {
	set-env GIT_SSH 'plink.exe'
}

var have_gnu_ls = ?(ls --version >&- 2>&-)
fn ls {|@a| e:ls --color $@a }
# BSD ls has --color now, too
#if (not $have_gnu_ls) {
#	set ls~ = $e:ls~
#}

var has_home_bin = $false
for path $paths {
	if (==s (path:abs $path) (path:abs "~/bin")) {
		set has_home_bin = $true
	}
}
if (not $has_home_bin) {
	set paths = [~/bin $@paths]
}

# Import ~/.elvish/rc-local.elv in the current scope if it exists, drop error message.
set _ = ?(eval (slurp <~/.elvish/rc-local.elv))

