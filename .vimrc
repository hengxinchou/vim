syntax on

set laststatus=2 " 显示状态栏 (默认值为 1, 无法显示状态栏)
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)
"设置在状态行显示的信息

set tabstop=4 " 设定 tab 长度为 4
"set smartindent " 开启新行时使用智能自动缩进
set encoding=utf-8
set history=1000
set guifont=Monaco:h18

"当有大写就区分大小写，没有大写字母就不区分大小写
"要想实现这种功能，必须先设置 ignorecase，再接着设置 smartcase 变量
:set ignorecase
:set smartcase
set hlsearch " 搜索时高亮显示被找到的文本 ":noh 关闭搜索时高亮
"set nowrapscan " 禁止在搜索到文件两端时重新搜索
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

"Vundle start
set nocompatible              " be iMproved, required
filetype off                  " required

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'

Plugin 'git://git.wincent.com/command-t.git'

"The sparkup vim script is in a subdirectory of this repo called vim.
"Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

Plugin 'preservim/nerdtree'

"Plugin 'Valloric/YouCompleteMe'

"类似idea，文本结构缩略图
Plugin 'preservim/tagbar'

"最近打开的文件
Plugin 'yegappan/mru'
"模糊匹配，查找文件，类似Windows的Everything，速度超快
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

"对象增强,例如给一个单词套上引号
Plugin 'tpope/vim-surround'

"撤销树
Plugin 'mbbill/undotree'

call vundle#end()            " required
filetype plugin indent on    " required
"Vundle end

"keymap start
map <C-A> ggVG
vnoremap <C-C> "+y
nnoremap XX :q!<CR>
inoremap jk <Esc>
cnoremap jk <Esc>
vnoremap jk <Esc>
nnoremap <Leader>v viw"0p
vnoremap <Leader>v "0p
"keymap end

"NERDTree start
map <F5> :NERDTreeToggle<CR>
let NERDTreeWinSize=15
"NERDTree end

"Tagbar start
nmap <F8> :TagbarToggle<CR>
let g:tagbar_width=40
"Tagbar end

"fzf start
nnoremap <F2> :Files<CR>
"fzf end
"
"undoTree start
nnoremap <F6> :UndotreeToggle<CR>
"undoTree end


"自动补全
":inoremap ( ()<ESC>i
":inoremap ) <c-r>=ClosePair(')')<CR>
":inoremap { {<CR>}<ESC>O
":inoremap } <c-r>=ClosePair('}')<CR>
":inoremap [ []<ESC>i
":inoremap ] <c-r>=ClosePair(']')<CR>
":inoremap " ""<ESC>i
":inoremap ' ''<ESC>i
"
"et undodir=~/.vim/undodir

"设置支持跨会话撤销
"set backup
"set undofile
set nobackup
set undodir=~/.vim/undodir

if !isdirectory(&undodir)
  call mkdir(&undodir, 'p', 0700)
endif

"如果支持鼠标，就开始鼠标支持，并且在不同的系统开启不同的设置
if has('mouse')
  if has('gui_running') || (&term =~ 'xterm' && !has('mac'))
    set mouse=a
  else
    set mouse=nvi
  endif
endif

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

map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
