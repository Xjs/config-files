edit:insert:binding[Alt-Backspace] = $edit:kill-small-word-left~
edit:insert:binding[Alt-Delete] = $edit:kill-small-word-right~
edit:insert:binding[Ctrl-Backspace] = $edit:kill-small-word-left~
edit:insert:binding[Ctrl-Delete] = $edit:kill-small-word-right~

edit:insert:binding[Ctrl-Left] = $edit:move-dot-left-small-word~
edit:insert:binding[Ctrl-Right] = $edit:move-dot-right-small-word~
edit:insert:binding[Alt-Left] = $edit:move-dot-left-small-word~
edit:insert:binding[Alt-Right] = $edit:move-dot-right-small-word~

edit:insert:binding[Ctrl-Alt-Backspace] = $edit:kill-word-left~
edit:insert:binding[Ctrl-Alt-Delete] = $edit:kill-word-right~
edit:insert:binding[Ctrl-Alt-Left] = $edit:move-dot-left-word~
edit:insert:binding[Ctrl-Alt-Right] = $edit:move-dot-right-word~

use github.com/zzamboni/elvish-completions/cd
use github.com/zzamboni/elvish-completions/git
use github.com/zzamboni/elvish-completions/ssh

if (has-external plink.exe) {
	set-env GIT_SSH 'plink.exe'
}

@discard = (have_gnu_ls = ?(ls --version 2>&-))
fn ls [@a]{ e:ls --color $@a }
if (not $have_gnu_ls) {
	up:ls~ = $e:ls~
}

has_home_bin = $false
for path $paths {
	if (==s (path-abs $path) (path-abs "~/bin")) {
		has_home_bin = $true
	}
}
if (not $has_home_bin) {
	paths = [~/bin $@paths]
}

# Import ~/.elvish/rc-local.elv in the current scope if it exists, drop error message.
if ?(-source ~/.elvish/rc-local.elv) { }
