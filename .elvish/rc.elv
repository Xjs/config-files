use github.com/zzamboni/elvish-completions/cd
use github.com/zzamboni/elvish-completions/git
use github.com/zzamboni/elvish-completions/ssh

if (has-external plink.exe) {
	set-env GIT_SSH 'plink.exe'
}

fn ls [@a]{ e:ls --color $@a }

