syntax on

set laststatus=2 " 显示状态栏 (默认值为 1, 无法显示状态栏)
"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)
"设置在状态行显示的信息

set tabstop=4 " 设定 tab 长度为 4
"set smartindent " 开启新行时使用智能自动缩进
set encoding=utf-8
set history=1000
set guifont=Monaco:h18
"set guifont=Source\ Code\ Pro:h18

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

"Vundle start
set nocompatible              " be iMproved, required
filetype off                  " required

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"对git支持
Plugin 'tpope/vim-fugitive'
"可以达到vscode/idea的效果，实时查看文件内的变动情况，把变动在左边栏显示出来
Plugin 'airblade/vim-gitgutter'

Plugin 'git://git.wincent.com/command-t.git'

"The sparkup vim script is in a subdirectory of this repo called vim.
"Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

"目录树
Plugin 'preservim/nerdtree'

"各种语言的自动补全，对c/c++语言支持特别好
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

"vim默认只能重复默认的命令
"vim-repeat可以重复插件或者自定义的命令，譬如来自vim-surround的命令
Plugin 'tpope/vim-repeat'

"撤销树
Plugin 'mbbill/undotree'

"异步操作，还能继续做点别的，不阻塞
Plugin 'skywind3000/asyncrun.vim'

"提供uninx的常用命令，它提供的 :Rename 和 :Move 命令，后面跟的参数就是新的名字或路径
Plugin 'tpope/vim-eunuch'
"主题方案
Plugin 'morhetz/gruvbox'
Plugin 'nanotech/jellybeans.vim'
Plugin 'mbbill/desertEx'
"字体
"Plugin 'tonsky/FiraCode'


Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"调色工具
Plugin 'vim-scripts/SyntaxAttr.vim'

"注释
Plugin 'preservim/nerdcommenter'

Plugin 'easymotion/vim-easymotion'



"TODO-learning
Plugin 'mg979/vim-visual-multi'
"Plugin 'ap/vim-buftabline'
"Plugin 'fatih/vim-go'
"Plugin 'vrothberg/vgrep'
"Plugin 'mhinz/vim-grepper'
"Plugin 'tpope/vim-unimpaired'


call vundle#end()            " required
filetype plugin indent on    " required
"Vundle end

colorscheme desertEx

"快速的不保存就退出，当查看只读文档特别有用，更有效率
nnoremap XX :q!<CR>

"按<Esc>手指要伸得过长，所以设置快捷键进行快速操作,要非递归的映射，否则映射不成功
"还是取消了，影响了正常的输入
"inoremap jk <Esc>
"cnoremap jk <Esc>
"vnoremap jk <Esc>

"全选所有内容
map <C-A> ggVG

"复制选中的内容到系统粘贴板
vnoremap <C-C> "+y

"快速的替换当前的内容，使用寄存器0，而不是无名寄存器
"不能使用无名寄存器，因为被替换的内容也会覆盖无名寄存器
nnoremap <Leader>v viw"0p
vnoremap <Leader>v "0p
"在命令行可以复制之前在文件里yank的文本，例如在:grep 用得还挺多的
cnoremap <leader>p <C-R>"

"显示行号是个两难，阅读代码时不时需要显示行号，但是在写的时候不想看行号，太污染屏幕
nnoremap <leader>1 :set nu<cr>
nnoremap <leader>2 :set nonu<cr> "快速在窗口之间跳转
" 这样反而会打乱我对<C-W>的使用
"map <C-j> <C-W>j
"map <C-k> <C-W>k
"map <C-h> <C-W>h
"map <C-l> <C-W>l

"C-Tab跟Iterm2的keymap冲突，要记得先删除Iterm2的keymap
"不需要了，我用得不错
"nnoremap <C-Tab>   <C-W>w
"inoremap <C-Tab>   <C-O><C-W>w
"nnoremap <C-S-Tab> <C-W>W
"inoremap <C-S-Tab> <C-O><C-W>W

"修改了.vimrc, vim不需要退出就能加载最新的配置
"对于目前还在学习vim中的我，这个操作尤其频繁
nnoremap <Leader>5 :source ~/.vimrc<cr>

"nerdtree start
map <f1> :NERDTreeToggle<cr>
let NERDTreeWinSize=35
"NERDTree end

"fzf start
nnoremap <F2> :Files<CR>
"fzf end

"Tagbar start
nmap <F3> :TagbarToggle<CR>
let g:tagbar_width=40
"Tagbar end

"undoTree start
nnoremap <F4> :UndotreeToggle<CR>
"undoTree end

" 用于 quickfix、标签和文件跳转的键映射
nmap <F7>   :cn<CR>
nmap <F8>   :cp<CR>
nmap <M-F7> :copen<CR>
nmap <M-F8> :cclose<CR>
nmap <C-F7> :tn<CR>
nmap <C-F8> :tp<CR>
nmap <S-F7> :n<CR>
nmap <S-F8> :prev<CR>

"自动补全
":inoremap ( ()<ESC>i
":inoremap ) <c-r>=ClosePair(')')<CR>
":inoremap { {<CR>}<ESC>O
":inoremap } <c-r>=ClosePair('}')<CR>
":inoremap [ []<ESC>i
":inoremap ] <c-r>=ClosePair(']')<CR>
":inoremap " ""<ESC>i
":inoremap ' ''<ESC>i

"设置支持跨会话撤销
set nobackup
set undofile
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

" 不需要了，我用得也不多
map <Leader>tn :tabnew<cr>
map <Leader>to :tabonly<cr>
map <Leader>tc :tabclose<cr>
map <Leader>tm :tabmove

" ctags start
set tags=./tags;,tags,/usr/local/etc/systags
" ctags end

" 参考吴咏炜的配置

" 启用vim自带的 man插件, :Man就可以在vim直接查看man手册
source $VIMRUNTIME/ftplugin/man.vim
set keywordprg=:Man

" 异步运行命令时打开 quickfix 窗口，高度为 10 行
"let g:asyncrun_open = 10

"gitGutter start
highlight! link SignColumn LineNr
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
let g:gitgutter_set_sign_backgrounds = 1
""gitGutter end


if has('gui_running')
  " 不延迟加载菜单（需要放在下面的 source 语句之前）
  let do_syntax_sel_menu=1
  let do_no_lazyload_menus=1
endif



if has('termguicolors') &&
      \($COLORTERM == 'truecolor' || $COLORTERM == '24bit')
  set termguicolors
endif


"调色工具
nnoremap <Leader>a :call SyntaxAttr()<CR>

"如果打开一个窗口多个文件，设置自动保存比较好，idea等自动保存
"vscode其实也会缓存备份，不会丢失
nnoremap <Leader>6 :set autowrite<CR>

let g:airline_powerline_fonts = 1 "这个会让我的airline状态栏乱码
let g:airline#extensions#tabline#enabled = 1 " 展示顶部的状态栏
let g:airline#extensions#tabline#buffer_nr_show = 1 " 展示:buffers中的序号，便于通过:buffer number跳转
let g:airline#extensions#tabline#buffer_idx_mode = 3 " 展示:buffer中的序号,可以通过快捷键快速切换到指定的buffer
let g:airline#extensions#tabline#overflow_marker = '…' "使用 … 来表示省略（单个字符，而非占据三列的三个点），这样可以节约一点屏幕空间。
"let g:airline#extensions#tabline#show_tab_nr = 0 "关掉tab的展示

set scrolloff=1

"删除空白行波浪线提示
:hi NonText guifg=bg


"发现打开了相同的文件，自动调回之前的文件
if v:version >= 800
	packadd! editexisting
endif

"调整命令行窗口
set cmdheight=2

"easy-motion
"map <Leader> <Plug>(easymotion-prefix)

"去掉乌干达欢迎语
set shm+=I

cnoremap <expr>%% getcmdtype() == ':' ? expand('%:h').'/':'%%'


