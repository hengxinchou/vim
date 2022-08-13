syntax on
set hlsearch " 搜索时高亮显示被找到的文本
set laststatus=2 " 显示状态栏 (默认值为 1, 无法显示状态栏)
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)
"设置在状态行显示的信息
"set nowrapscan " 禁止在搜索到文件两端时重新搜索
"set incsearch " 输入搜索内容时就显示搜索结果
set tabstop=4 " 设定 tab 长度为 4
set smartindent " 开启新行时使用智能自动缩进
set encoding=utf-8
set history=1000
set guifont=Monaco:h18

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
"alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

"let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'

Plugin 'git://git.wincent.com/command-t.git'

"The sparkup vim script is in a subdirectory of this repo called vim.
"Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

Plugin 'preservim/nerdtree'

Plugin 'Valloric/YouCompleteMe'

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
"To ignore plugin indent changes, instead use:
"filetype plugin on
"
"Brief help
":PluginList       - lists configured plugins
":PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
":PluginSearch foo - searches for foo; append `!` to refresh local cache
":PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
"see :h vundle for more details or wiki for FAQ
"Put your non-Plugin stuff after this line

"Vundle end



"keymap start
map <C-A> ggVG
vnoremap <C-C> "+y
nnoremap XX :q!<CR>
map jk <Esc>
nnoremap <Leader>v viw"0p
vnoremap <Leader>v "0p
"keymap end

"NERDTree start
map <F5> :NERDTreeToggle<CR>
let NERDTreeWinSize=15
"NERDTree end

"Tagbar start
nmap <F8> :TagbarToggle<CR>
let g:tagbar_width=20
"Tagbar end

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

"set backup
"set undofile

set nobackup
set undodir=~/.vim/undodir

if !isdirectory(&undodir)
  call mkdir(&undodir, 'p', 0700)
endif


if has('mouse')
  if has('gui_running') || (&term =~ 'xterm' && !has('mac'))
    set mouse=a
  else
    set mouse=nvi
  endif
endif



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

"set showcmd

map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
