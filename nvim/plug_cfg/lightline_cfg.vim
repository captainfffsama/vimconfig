" lightline设置
if has('nvim')
else
	set laststatus=2
	"export TERM=xterm-256color
	if !has('gui_running')
		set t_Co=256
	endif
	set noshowmode
endif
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ }
