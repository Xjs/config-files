filetype plugin on
filetype indent on

set smarttab
set shiftwidth=4
set tabstop=4

set encoding=utf8

set ai " Auto indent
set cindent " Smart indent
set wrap " Wrap lines

syntax enable
set number
set nuw=1

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal' || $COLORTERM == 'xterm-256color'
	set t_Co=256
endif
set background=dark
colorscheme zellner

