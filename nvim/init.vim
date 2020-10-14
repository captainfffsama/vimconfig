" >>> 插件管理 <<<---------------------------------------------------{
if has('nvim')
	let g:root_dir=expand('~/.config/nvim/')
	let g:plug_dir=expand('~/.config/nvim/plugged')
else
	let g:root_dir=expand('~/.vim/')
	let g:plug_dir=expand('~/.vim/plugged')
endif
" 使用vim-plug管理vim插件
call plug#begin(g:plug_dir)
" vim显示插件
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
" 解决tmux和vim复制粘贴
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'roxma/vim-tmux-clipboard'
" 使用fzf
" Plug '/home/chiebotgpuhq/.fzf'
" Plug 'junegunn/fzf.vim'
" 文件管理器
if has('nvim')
    Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
	Plug 'Shougo/defx.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif
" vim中文文档
if has('nvim')
	Plug 'yianwillis/vimcdoc', { 'do': ':help'}
else
	Plug 'yianwillis/vimcdoc', { 'do': ':help'}
endif
" python缩进显示
Plug 'Yggdroot/indentLine'
" dracula主题
Plug 'dracula/vim', { 'as': 'dracula' }
" sneak插件用于跳转
Plug 'justinmk/vim-sneak'
" easymotion插件用于跳转
Plug 'easymotion/vim-easymotion'
" coc插件,用于支持各类语言的补全
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" 状态栏
Plug 'itchyny/lightline.vim'
call plug#end()

" }

" >>> 插件设置 <<<----------------------------------------------------



" >>> 功能设置 <<<-----------------------------------------------------

" 将系统和vim剪贴板互通
set clipboard+=unnamedplus
" 显示行号
set nonumber

" 设置编码,支持中文乱码
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1,gb2312,cp936
" set termencoding=utf-8
set enc=utf8

" 突出显示当前行
" set cursorline
" 突出显示当前列
" set cursorcolumn
" 启用鼠标 设置为a启用鼠标，设置为v可以将鼠标赋值内容到剪切板
set mouse=a
set selection=exclusive
set selectmode=mouse,key
" 显示括号匹配
set showmatch

" 设置缩进
" 设置Tab长度为4空格
set tabstop=4
" 设置自动缩进长度为4空格
set shiftwidth=4
" 继承前一行的缩进方式，适用于多行注释
set autoindent
" 设置粘贴模式
" set paste " 直接这样设置在tmux中使用会导致失焦插入<F24><F25>
" 使用F10切换粘贴模式
set pastetoggle=<F10>

" 显示空格和tab
set listchars=tab:>-,trail:-
" 显示状态栏和光标当前位置
" 总是显示状态栏
" set laststatus=2
" 显示光标当前位置
set ruler
" 基于缩进进行代码折叠
set foldmethod=indent
" 启动 Vim 时关闭折叠
set nofoldenable

" >>> 性能设置 <<<------------------------------------------------------
" 打开文件类型检测
filetype plugin indent on

" >>> 按键映射 <<<-----------------------------------------------------
let mapleader = "\<space>"
" let mapleader = ','
" 快速打开vimrc 
nnoremap <leader>ev :o $MYVIMRC<cr> 
" 重载vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>
" === 功能映射 ===
" 将ctrl+s映射为保存文件
nnoremap <C-S> :w<CR>

" 加载各种设置
for s:path in split(glob(g:root_dir . 'vimrc/*.vim'), "\n")
	exec 'source' . s:path
endfor

for s:path in split(glob(g:root_dir . 'plug_cfg/*.vim'), "\n")
	exec 'source' . s:path
endfor
" 加载各种插件配置

" === 插件快捷键 ===
" 离开vim时关闭coc
autocmd VimLeavePre * if get(g:, 'coc_process_pid', 0) | call system('kill -9 '.g:coc_process_pid) | endif
