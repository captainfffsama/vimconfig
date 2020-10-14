" 使vimrc配置立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC
" 在vim中去除tmux开关
autocmd VimEnter,VimLeave * silent !tmux set status off
" 正确显示json高亮
autocmd FileType json syntax match Comment +\/\/.\+$+
