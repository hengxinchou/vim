set shm+=I
set nocompatible  

set guifont=Courier_New:h16

set tabstop=4 " 设定 tab 长度为 4
"set smartindent " 开启新行时使用智能自动缩进
set encoding=utf-8
set history=1000
set backspace=indent,eol,start

"colo industry
colo monokai

syntax on

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }
"类似 sublime
Plug 'sickill/vim-monokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()


"nerdtree start
map <f1> :NERDTreeToggle<cr>
"NERDTree end


let g:airline_powerline_fonts = 1 "这个会让我的airline状态栏乱码. 后来发现 guifont要配对应的字体 xxx for powerline
let g:airline#extensions#tabline#enabled = 1 " 展示顶部的状态栏
let g:airline#extensions#tabline#buffer_nr_show = 1 " 展示:buffers中的序号，便于通过:buffer number跳转
let g:airline#extensions#tabline#buffer_idx_mode = 3 " 展示:buffer中的序号,可以通过快捷键快速切换到指定的buffer
let g:airline#extensions#tabline#overflow_marker = '…' "使用 … 来表示省略（单个字符，而非占据三列的三个点），这样可以节约一点屏幕空间。
"let g:airline#extensions#tabline#show_tab_nr = 0 "关掉tab的展示

"if has('gui_running')
  " 不延迟加载菜单（需要放在下面的 source 语句之前）
  let do_syntax_sel_menu=1
  let do_no_lazyload_menus=1
"endif


"设置支持跨会话撤销
set nobackup
set undofile
set undodir=~/vimfiles/undodir


"修改了.vimrc, vim不需要退出就能加载最新的配置
"对于目前还在学习vim中的我，这个操作尤其频繁
nnoremap <Leader>5 :source ~/_vimrc<cr>

