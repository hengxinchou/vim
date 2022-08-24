set shm+=I
set nocompatible  

"set guifont=Courier_New:h16
set guifont=Fira\ Code:h14

set tabstop=4 " 设定 tab 长度为 4
"set smartindent " 开启新行时使用智能自动缩进
set encoding=utf-8
set history=1000
set backspace=indent,eol,start

"当有大写就区分大小写，没有大写字母就不区分大小写
"要想实现这种功能，必须先设置 ignorecase，再接着设置 smartcase 变量
:set ignorecase
:set smartcase
set hlsearch " 搜索时高亮显示被找到的文本 ":noh 关闭搜索时高亮
" 经常要取消高亮，所以设置一个快捷键来操作
nnoremap <Leader>4 :nohlsearch<CR>
"方便在窗口间跳转，窗口多了，窗口跳转就变得很频繁
"在Tagbar中过滤，显示使用递进搜索会比较方便，但正常时候不需要启动递进搜索，因为递进搜索容易污染屏幕
nnoremap <Leader>3 :set incsearch<CR>
set nowrapscan " 禁止在搜索到文件两端时重新搜索
"set incsearch "递进搜索, 输入搜索内容时就显示搜索结果


"自动识别paste的语法 start
if !has('patch-8.0.210') " 进入插入模式时启用括号粘贴模式 let &t_SI .= "\<Esc>[?2004h" " 退出插入模式时停用括号粘贴模式
  let &t_EI .= "\<Esc>[?2004l"
  " 见到 <Esc>[200~ 就调用 XTermPasteBegin
  inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

  function! XTermPasteBegin()
    " 设置使用 <Esc>[202~ 关闭粘贴模式
    set pastetoggle=<Esc>[201~
    " 开启粘贴模式
    set paste
    return ""
  endfunction
endif
"自动识别paste的语法 end



call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

"对象增强,例如给一个单词套上引号
Plug 'tpope/vim-surround'

"vim默认只能重复默认的命令
"vim-repeat可以重复插件或者自定义的命令，譬如来自vim-surround的命令
Plug 'tpope/vim-repeat'

"撤销树
Plug 'mbbill/undotree'

"类似idea，文本结构缩略图
Plug 'preservim/tagbar'

"最近打开的文件
Plug 'yegappan/mru'


"对git支持
Plug 'tpope/vim-fugitive'
"可以达到vscode/idea的效果，实时查看文件内的变动情况，把变动在左边栏显示出来
Plug 'airblade/vim-gitgutter'

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }
"类似 sublime
Plug 'sickill/vim-monokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"主题方案
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
Plug 'mbbill/desertEx'
Plug 'junegunn/seoul256.vim'
" 类似vscode
Plug 'kaicataldo/material.vim'
"很漂亮，偏海洋风
Plug 'ayu-theme/ayu-vim'

"注释
Plug 'preservim/nerdcommenter'

Plug 'easymotion/vim-easymotion'

Plug 'mg979/vim-visual-multi'

"python全家桶
Plug 'python-mode/python-mode'
"对括号有多个层次的颜色，对于嵌套很深的括号，很好看
Plug 'frazrepo/vim-rainbow'
"对大文件的支持，超过设置的就不适用语法高亮等，加快加载速度，很有用！
Plug 'vim-scripts/LargeFile'
"日历
Plug 'mattn/calendar-vim'
"一个游戏
Plug 'vim/killersheep'

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


if has('termguicolors') && 
						\($COLORTERM == 'truecolor' || $COLORTERM == '24bit')
	set termguicolors
endif

"colo industry
syntax enable
colorscheme monokai

"快速的不保存就退出，当查看只读文档特别有用，更有效率
nnoremap XX :q!<CR>


"undoTree start
nnoremap <F4> :UndotreeToggle<CR>
"undoTree end

"复制选中的内容到系统粘贴板
vnoremap <C-C> "+y

"删除空白行波浪线提示
:hi NonText guifg=bg

"发现打开了相同的文件，自动调回之前的文件
if v:version >= 800
	packadd! editexisting
endif


"vim-rainbow
au FileType c,cpp,objc,objcpp call rainbow#load()

let g:LargeFile = 100

set scrolloff=1


"设置最近打开的文件的快捷键
if !has('gui_running')
  " 设置文本菜单
  if has('wildmenu')
    set wildmenu
    set cpoptions-=<
    set wildcharm=<c-z>
    nnoremap <f10>      :emenu <c-z>
    inoremap <f10> <c-o>:emenu <c-z>
  endif
endif
