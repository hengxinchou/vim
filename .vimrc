"=====================================Basic Settings START==================================
if has('gui_running')
  " 不延迟加载菜单（需要放在下面的 source 语句之前）
  let do_syntax_sel_menu=1
  let do_no_lazyload_menus=1
endif
so $VIMRUNTIME/vimrc_example.vim
syntax on
set nocompatible
set lbr
set encoding=utf-8
"set backspace=indet,eol,start
set backspace=2
set history=1000
"对于阅读西文特别重要，即如果单行超过屏幕长度，多余的部分换屏幕行时保持缩进
set breakindent

"tab START
"设定 tab 长度为 4 set tabstop=4 
"set ts=4 跟tabstop同理
"表示在编辑模式的时候按退格键的时候退回缩进的长度，当使用 expandtab 时特别有用
set softtabstop=4 
"表示每一级缩进的长度，一般设置成跟 softtabstop 一样
set shiftwidth=4 
"表示缩进用空格来表示
set expandtab 
"自动缩进
set autoindent 
"开启新行时使用智能自动缩进
"set smartindent 
"tab END

"设置在状态行显示的信息
"当有大写就区分大小写，没有大写字母就不区分大小写
"要想实现这种功能，必须先设置 ignorecase，再接着设置 smartcase 变量
set ignorecase
set smartcase
" 搜索时高亮显示被找到的文本
set hlsearch 
"关闭搜索时高亮
":noh 
"方便在窗口间跳转，窗口多了，窗口跳转就变得很频繁 \
"在Tagbar中过滤，显示使用递进搜索会比较方便，但正常时候不需要启动递进搜索，因为递进搜索容易污染屏幕 \
"set incsearch<CR>
"禁止在搜索到文件两端时重新搜索
set nowrapscan 
"递进搜索, 输入搜索内容时就显示搜索结果
"set incsearch 
"不需要强制保存，就可以切换buffer
"set hidden

"打开就最大化gvim窗口
"if has('win32')
"	au GUIEnter * simalt ~x
"else
"	au GUIEnter * call MaximizeWindow()
"endif
"
"function! MaximizeWindow()
"	silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
"endfunction

"全选所有内容 
map <leader>a ggVG
"复制选中的内容到系统粘贴板,windows 用<C-C>， mac 用<M-C>
vnoremap <C-C> "+y
"vnoremap <M-C> "+y
"快速的不保存就退出，当查看只读文档特别有用，更有效率
"nnoremap XX :q!<CR>
"修改了.vimrc, vim不需要退出就能加载最新的配置 \
"对于目前还在学习vim中的我，这个操作尤其频繁
nnoremap <Leader>5 :source ~/.vimrc<cr>

"打开当前文件的所在目录，查看同一目录的别的文件有用
map <leader>8 :e %:h<CR>
"只留下当前缓存区，删除其他缓存区
"cap <leader>9 exe command "%bd |e \#"<CR>
command! BufOnly execute '%bdelete|edit #|normal `"'
nnoremap <C-B>c :BufCurOnly<CR>
"对于直接切换到文件所在目录非常有用, 有了:NERDTeeFind和":e %:H"感觉就没什么用了
"nnoremap <Leader>cd :lcd %:h<CR>

if has('termguicolors') && ($COLORTERM == 'truecolor' || $COLORTERM == '24bit')
	set termguicolors
endif
"快速的替换当前的内容，使用寄存器0，而不是无名寄存器
"不能使用无名寄存器，因为被替换的内容也会覆盖无名寄存器
"nnoremap <Leader>v viw"0p
"vnoremap <Leader>v "0p
"在命令行可以复制之前在文件里yank的文本，例如在:grep 用得还挺多的
"cnoremap <leader>p <C-R>"

"显示行号是个两难，阅读代码时不时需要显示行号，但是在写的时候不想看行号，太污染屏幕
"nnoremap <leader>1 :set nu<cr>
"nnoremap <leader>2 :set nonu<cr> "快速在窗口之间跳转
"
"设置支持跨会话撤销
set nobackup
set undofile
set undodir=~/.vim/undodir
if !isdirectory(&undodir)
  call mkdir(&undodir, 'p', 0700)
endif

"如果支持鼠标，就开始鼠标支持，并且在不同的系统开启不同的设置
"if has('mouse')
"  if has('gui_running') || (&term =~ 'xterm' && !has('mac'))
"    set mouse=a
"  else
"    set mouse=nvi
"  endif
"endif
set mouse=a

"设置最近打开的文件的快捷键
if !has('gui_running')
  " 设置文本菜单
  if has('wildmenu')
    set wildmenu
    set cpoptions-=<
    set wildcharm=<c-z>
    "nnoremap <f10>      :emenu <c-z>
    "inoremap <f10> <c-o>:emenu <c-z>
  endif
endif

set scrolloff=1
"删除空白行波浪线提示
:hi NonText guifg=bg
"发现打开了相同的文件，自动调回之前的文件
if v:version >= 800
	packadd! editexisting
endif
"调整命令行窗口
set cmdheight=2
"去掉乌干达欢迎语
set shm+=I

"快速扩展当前文件所在的绝对路径
"cnoremap <expr>%% getcmdtype() == ':' ? expand('%:h').'/':'%%'

" 不需要了，我用得也不多
"map <Leader>tn :tabnew<cr>
"map <Leader>to :tabonly<cr>
"map <Leader>tc :tabclose<cr>
"map <Leader>tm :tabmove


"如果打开一个窗口多个文件，设置自动保存比较好，idea等自动保存
"vscode其实也会缓存备份，不会丢失
"nnoremap <Leader>6 :set autowrite<CR>
command! BufCurOnly execute '%bdelete|edit #|normal `"'
nnoremap <C-B>c :BufCurOnly<CR>

"au BufNewFile,BufRead *.c			colorscheme ayu |let ayucolor="light" 
"au BufNewFile,BufRead *.c			let g:material_theme_style = 'lighter' 
"au FileType c,cpp,objc,objcpp			let g:material_theme_style = 'lighter' 
au FileType c,cpp,objc,objcpp      set expandtab
"c、cpp、java等都自动显示行号
au FileType c,cpp,objc,objcpp      set nu
au FileType c,cpp,objc,objcpp      set autoindent

au FileType java	           set nu
au FileType sh		           set nu
au FileType zsh		           set nu
au FileType vim		           set nu
au BufNewFile,BufRead *.log  set nu
au BufNewFile,BufRead *.log,*.conf,*.xml  set nu

"如何让vim退出「插入模式」的时候自动切换为英文输入法？ - 知乎用户WEBOMp的回答 - 知乎
"https://www.zhihu.com/question/341748857/answer/1739052604
"autocmd InsertLeave * :silent !fcitx-remote -c
"autocmd BufCreate *  :silent !fcitx-remote -c
"autocmd BufEnter *  :silent !fcitx-remote -c
"autocmd BufLeave *  :silent !fcitx-remote -c

"打开文件自动回到上次的退出的行，不用每次都按`"。
"au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
"if has("autocmd")
    "autocmd BufRead *.txt set tw=78
    "autocmd BufReadPost *
    "\ if line("'\"") > 0 && line ("'\"") <= line("$") |
    "\   exe "normal g'\"" |
    "\ endif
"endif
"autocmd BufReadPost * normal! g`"zv 

"=====================================Basic Settings END==================================

"Vim-Plug START
call plug#begin()
"对git支持
Plug 'tpope/vim-fugitive'
"GBrowse的支持
"Plug 'tpope/vim-rhubarb'
"可以达到vscode/idea的效果，实时查看文件内的变动情况，把变动在左边栏显示出来
Plug 'airblade/vim-gitgutter'
"类似vim-GitGutter的
"Plug 'mhinz/vim-signify'
"目录树
"Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
"Plug 'tpope/vim-vinegar'
"各种语言的自动补全，对c/c++语言支持特别好
Plug 'Valloric/YouCompleteMe'
"如果没有安装clangd的YCM，则可以用rtags进行查找引用，比较快
Plug 'lyuts/vim-rtags'
"indent对齐，很直观，像pycharm那样
"Plug 'nathanaelkane/vim-indent-guides'
"类似idea，文本结构缩略图
Plug 'preservim/tagbar'
"用于替代tagbar的
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
"LSP 类似vscode的强大自动补全功能, conquer of complete 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"韦一笑的quickfix预览功能，不用每次都打开文件或者buffer
"已经不维护了,用下马的vim-quickui替代
"Plug 'skywind3000/vim-preview'
"Plug 'skywind3000/vim-quickui'

"最近打开的文件
Plug 'yegappan/mru'
"模糊匹配，查找文件，类似Windows的Everything，速度超快
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
"对象增强,例如给一个单词套上引号
Plug 'tpope/vim-surround'
"vim默认只能重复默认的命令
"vim-repeat可以重复插件或者自定义的命令，譬如来自vim-surround的命令
Plug 'tpope/vim-repeat'
"通用的快捷键命令
Plug 'tpope/vim-unimpaired'
"撤销树
Plug 'mbbill/undotree'
"异步操作，还能继续做点别的，不阻塞
"Plug 'skywind3000/asyncrun.vim'
"提供uninx的常用命令，它提供的 :Rename 和 :Move 命令，后面跟的参数就是新的名字或路径
Plug 'tpope/vim-eunuch'
"主题方案
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
Plug 'mbbill/desertEx'
Plug 'junegunn/seoul256.vim'
" 类似vscode
Plug 'kaicataldo/material.vim'
"很漂亮，偏海洋风
Plug 'ayu-theme/ayu-vim'
"类似 sublime
Plug 'sickill/vim-monokai'
"状态栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"调色工具
Plug 'vim-scripts/SyntaxAttr.vim'
"注释
Plug 'preservim/nerdcommenter'
"类似 nerdcommenter 
"Plug 'tpope/vim-commentary'
"可以跨行去find或者till的移动
Plug 'justinmk/vim-sneak'
"Plug 'easymotion/vim-easymotion'
Plug 'mg979/vim-visual-multi'
"TODO-learning
"Plug 'ap/vim-buftabline'
"Plug 'fatih/vim-go'
"Plug 'vrothberg/vgrep'
"自来也推荐的
Plug 'mhinz/vim-grepper'
"有助于提高切换中文输入法的速度
"Plug 'xcodebuild/fcitx-vim-osx'
"Plug 'uguu-org/vim-matrix-screensaver'
"Plug 'CodeFalling/fcitx-vim-osx'
"Plug 'lipingcoding/autoim.vim'
"自动更新ctags
Plug 'ludovicchabant/vim-gutentags' 
"输入C语言函数名加 ( 时，Vim 就会在屏幕底部自动提示函数的原型
Plug 'mbbill/echofunc' 
"markdown预览
Plug 'iamcco/markdown-preview.nvim'
"python全家桶
"Plug 'python-mode/python-mode'
"对括号有多个层次的颜色，对于嵌套很深的括号，很好看
Plug 'frazrepo/vim-rainbow'
"对大文件的支持，超过设置的就不适用语法高亮等，加快加载速度，很有用！
Plug 'vim-scripts/LargeFile'
"日历
"Plug 'mattn/calendar-vim'
"一个游戏
"Plug 'vim/killersheep'
"Plug 'mechatroner/rainbow_csv'
"lsp
"Plug 'prabirshrestha/async.vim'
"Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'prabirshrestha/vim-lsp'
"Plug 'prabirshrestha/asyncomplete-lsp.vim'
"Plug 'prabirshrestha/asyncomplete-file.vim'
"tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'dhruvasagar/vim-table-mode'
"log highlighting 日志高亮
Plug 'MTDL9/vim-log-highlighting'
call plug#end()
"Vim-Plug END

"Airline START
"这个会让我的airline状态栏乱码. 后来发现 guifont要配对应的字体 xxx for "powerline
let g:airline_powerline_fonts = 1 
" 展示顶部的状态栏
let g:airline#extensions#tabline#enabled = 1 
" 展示:buffers中的序号，便于通过:buffer number跳转
"let g:airline#extensions#tabline#buffer_nr_show = 1 
"文件只暂时简单的文件名，去掉目录路径
let g:airline#extensions#tabline#formatter = 'unique_tail'
"let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
"三言两语说不清楚，看帮助文档
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
        \ '0': '0',
        \ '1': '1',
        \ '2': '2',
        \ '3': '3',
        \ '4': '4',
        \ '5': '5',
        \ '6': '6',
        \ '7': '7',
        \ '8': '8',
        \ '9': '9'
        \}
"可能我自己定义了leader,
""所以上面的g:airline#extensions#tabline#buffer_idx_mode不生效,要手动映射
for i in range(1, 9)
  exe printf('nmap <silent> <Space>%d <Plug>AirlineSelectTab%d', i, i)
endfor
"使用 … 来表示省略（单个字符，而非占据三列的三个点），这样可以节约一点屏幕空间。
"let g:airline#extensions#tabline#overflow_marker = '…' 
"关掉tab的展示
"let g:airline#extensions#tabline#show_tab_nr = 0 
"Airline END

"C programming START
"对C语言的优化
"用来标记空格错误，包括了 tab 字符前的空格和行尾空格，这样设置之后 Vim 会把这样的空格加亮出来。
let g:c_space_errors = 1
"激活 GNU 扩展，这在 Unix 下一般是必要的
let g:c_gnu = 1
"不对 printf 或类似函数里的的格式化字串进行加亮。这条可能看个人需要了。我是对错误的加亮超级反感，所以关闭这种不分场合的加亮。
let g:c_no_cformat = 1
"为了让一些 GNU 的扩展能够正确显示，不会被标志成错误。
let g:c_no_curly_error = 1
"Vim 默认会在注释中加亮字符串和数字（c_comment_strings）。虽然这种加亮有时候也能派上用场，但这种配置下我常常在注释中见到错误的加亮，所以我还是关闭这个功能。
if exists('g:c_comment_strings')
  unlet g:c_comment_strings
endif
"其他 :help ft-c-syntax
"C programming START

"Cscope
"cscope使用quickfix进行快速跳转。不设置的话会出现一个很长的列表让你选择
"s:symbol,c:call(被那些函数调用), d:called(被这个函数调用的), i:include,
"t:text, e: egrep,f:file, a:assigned    
set cscopequickfix=s-,c-,d-,i-,t-,e-,a-
"来自if_cscop.txt的快捷键推荐
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>a :cs find a <C-R>=expand("<cword>")<CR><CR>
"if has("cscope")
        "set csprg=/usr/local/bin/cscope
        "set csto=0
        "set cst
        "set nocsverb
        "" add any database in current directory
        "if filereadable("cscope.out")
            "cs add cscope.out
        "" else add database pointed to by environment
        "elseif $CSCOPE_DB != ""
            "cs add $CSCOPE_DB
        "endif
        "set csverb
"endif
set csprg=/opt/homebrew/bin//gtags-cscope
let $GTAGSLABEL='native-pygments'
let $GTAGSCONF='/opt/homebrew/Cellar/global/6.6.8/share/gtags/gtags.conf'
"自动加载GTAGS的数据库
if executable("gtags-cscope")
        set csto=0
        set cst
        set nocsverb
        "" add any database in current directory
        if filereadable("GRTAGS")
            cs add GRTAGS
        endif
        if filereadable("GPATH")
            cs add GPATH
        endif
        if filereadable("GTAGS")
            cs add GTAGS
        endif
        set csverb
endif
"Cscope


"ClangComplete START
"C语言的自动补全, 有YCM感觉没有必要了
"let g:clang_library_path = '/opt/homebrew/opt/llvm/lib/libclang.dylib'
"ClangComplete END

"Clang-Format START
"C语言的自动格式化代码, 有YCM感觉没有必要了
"noremap <silent> <Tab> :pyxf /opt/homebrew/opt/llvm/lib/clang-format.py<CR>
"Clang-Format END

"Ctags START
"参考https://www.zhihu.com/question/47691414?utm_id=0
"set tags=./tags;,tags,/usr/local/etc/systags
"set tags=./.tags;,.tags
set tags=./tags;,tags
"Ctags END

"devicons START
"去掉airline#tabline的icon，太占地方
let g:webdevicons_enable_airline_tabline = 0
"devicons END

"Fzf START
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
nnoremap <F2> :Files<CR>
"Fzf END

"Font and colorschema START
"set guifont=Monaco:h18
"set guifont=DejaVu Sans Mono for Powerline:h18
"set guifont=Fira\ Code:h22
"set guifont=Source\ Code\ Pro:h18
set guifont=FiraCode\ Nerd\ Font:h18
"colorscheme desertEx
"colorscheme material
"let g:material_theme_style = 'default' | 'palenight' | 'ocean' | 'lighter' | 'darker' | 'default-community' | 'palenight-community' | 'ocean-community' | 'lighter-community' | 'darker-community'
"let g:material_theme_style = 'ocean-community' 
"colorscheme seoul256
"colorscheme seoul256-light
"set background=light
"ayu#mirage偏海洋气息
"set termguicolors
colorscheme ayu
"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme
"colorscheme monokai
"比较暖色系
"colorscheme gruvbox
"let g:gruvbox_termcolors=16
"比较冷色系
"colorscheme jellybeans
"let g:jellybeans_use_lowcolor_black=0
"中等，绿色黄色为主
"colorscheme desertEx
"colorscheme seoul256
"Font and colorschema END

"Git-Fugitive/vim-rhubarb START
let g:github_enterprise_urls = ['https://www.github.com']
"Git-Fugitive/vim-rhubarb END

"GitGutter START
highlight! link SignColumn LineNr
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
let g:gitgutter_set_sign_backgrounds = 1
"默认是4000,单位是ms，改快一些。
set updatetime=100
"GitGutter END

"vim-Grep START
"normal或者visual下，直接搜索！！这就是我想要的功能！！
nmap gs  <plug>(GrepperOperator)
xmap gs  <plug>(GrepperOperator)
"自来也的推荐的映射
"if exists(':GrepperRg')
"        " 这种方式没法直接使用rg的命令行参数 但可以实现
"        " -dir          指定文件或目录 cwd | file | filecwd | repo `h:g:grepper.dir`
"        " -buffer       只搜索当前文件
"        " -buffers      所有打开的文件
"        vnoremap <F5> <Esc>:<C-u>Grepper -dir cwd -tool rg -noprompt -query '\b<C-r>=GetVisual('rg')<CR>\b'  <C-h>
"        vnoremap <F6> <Esc>:<C-u>Grepper-buffers -dir cwd -tool rg -noprompt -query '\b<C-r>=GetVisual('rg')<CR>\b'  <C-h>
"        nnoremap <expr> <F5> ":<C-u>Grepper -dir cwd -tool rg -noprompt -query '\\b" . expand('<cword>') . "\\b' "
"        nnoremap <expr> <F6> ":<C-u>Grepper-buffers -dir cwd -tool rg -noprompt -query '\\b" . expand('<cword>') . "\\b' "
"elseif exists(':GrepperGrep')
"        vnoremap <F5> <Esc>:<C-u>Grepper -dir cwd -tool grep -noprompt -query '\<<C-r>=GetVisual('grep')<CR>\>'  <C-h>
"        vnoremap <F6> <Esc>:<C-u>Grepper-buffers -dir cwd -tool grep -noprompt -query '\<<C-r>=GetVisual('grep')<CR>\>'  <C-h>
"        nnoremap <expr> <F5> ":<C-u>Grepper -dir cwd -tool grep -noprompt -query '\\<" . expand('<cword>') . "\\>' "
"        nnoremap <expr> <F6> ":<C-u>Grepper-buffers -dir cwd -tool grep -noprompt -query '\\<" . expand('<cword>') . "\\>' "
"    endif
"vim-Grep END

"Gutentags START
"https://www.zhihu.com/question/47691414/answer/373700711
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
" hg是mercury管理工具
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = 'tags'
" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
"同时开启 ctags 和 gtags 支持
let g:gutentags_modules = []
if executable('ctags')
	let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
endif
" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extras=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行，老的 Exuberant-ctags 不能加下一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']
" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif
"Gutentags END

"LSP START
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"
"
"function! s:on_lsp_buffer_enabled() abort
"    setlocal omnifunc=lsp#complete
"    setlocal signcolumn=yes
"    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
"    nmap <buffer> gd <plug>(lsp-definition)
"    nmap <buffer> gs <plug>(lsp-document-symbol-search)
"    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
"    nmap <buffer> gr <plug>(lsp-references)
"    nmap <buffer> gi <plug>(lsp-implementation)
"    nmap <buffer> gt <plug>(lsp-type-definition)
"    nmap <buffer> <leader>rn <plug>(lsp-rename)
"    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
"    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
"    nmap <buffer> K <plug>(lsp-hover)
"    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
"    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)
"
"    let g:lsp_format_sync_timeout = 1000
"    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
"    
"    " refer to doc to add more commands
"endfunction
"
"augroup lsp_install
"    au!
"    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
"    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
"augroup END
" 
"
"au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
"    \ 'name': 'file',
"    \ 'whitelist': ['*'],
"    \ 'priority': 10,
"    \ 'completor': function('asyncomplete#sources#file#completor')
"    \ }))
"
"if executable('pyls')
"    au User lsp_setup call lsp#register_server({
"        \ 'name': 'pyls',
"        \ 'cmd': {server_info->['pyls']},
"        \ 'whitelist': ['python'],
"        \ })
"endif
"
""bash
"if executable('bash-language-server')
"  au User lsp_setup call lsp#register_server({
"        \ 'name': 'bash-language-server',
"        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'bash-language-server start']},
"        \ 'whitelist': ['sh'],
"        \ })
""
"endif
"
"" Register ccls C++ lanuage server.
"if executable('ccls')
"   au User lsp_setup call lsp#register_server({
"      \ 'name': 'ccls',
"      \ 'cmd': {server_info->['ccls']},
"      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
"      \ 'initialization_options': {'cache': {'directory': expand('~/.cache/ccls') }},
"      \ 'allowlist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
"      \ })
"endif
"LSP START

"Leaderf START
nnoremap <Leader>lf :Leaderf --popup function<CR>
"Leaderf END
"LargeFile START
"单位为M
let g:LargeFile = 100
"LargeFile END 

"Man START
" 参考吴咏炜的配置
" 启用vim自带的 man插件, :Man就可以在vim直接查看man手册
"source $VIMRUNTIME/ftplugin/man.vim
"set keywordprg=:Man
"Man END

"Netrw START
"disable netrw
let g:loaded_netrw       = 0
let g:loaded_netrwPlugin = 0
"Netrw END

"Vim-Plugin START
command! MyPlugInstall execute ':w|so ~/.vimrc|PlugInstall'
nnoremap <F8> :MyPlugInStall<CR>
" map <F8> :w|so ~/.vimrc|PlugInstall<CR>
"Vim-Plugin START

"NERDTree START
map <F1> :NERDTreeToggle<cr>
"当打开某个文件时，就把目录切换到该文件的目录下
let g:NERDTreeChDirMode = 2
"替代vim内置的netrw， vim . 目录时默认用NERDTree
let g:NERDTreeHijackNetrw = 1
"设置鼠标点击目录和文件的方式，3为单机就打开目录和文件
let g:NERDTreeMouseMode=3
"默认显示隐藏的文件，以.开头的文件,
"其实直接大写I切换要不要隐藏文件，也挺方便的
"let g:NERDTreeShowHidden=1
" 如果最后只剩下nerdtree窗口，则直接关闭
let NERDTreeShowLineNumbers=1
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"打开目录的这个文件, idea的 always select opened file
nnoremap <leader>7 :NERDTreeFind<CR>
" Start NERDTree when Vim is started without file arguments.
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
"Start NERDTree when Vim starts with a directory argument.
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
"    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
" Start NERDTree and put the cursor back in the other window.
"autocmd VimEnter * NERDTree | wincmd p
"打开vim就自动打开nerdtree
"autocmd vimenter * NERDTree
"指定打开和折叠目录的提示符
"let NERDTreeDirArrowExpandable=">"
"let NERDTreeDirArrowCollapsible="v"
"指定NERDTree窗口的大小 
"let NERDTreeWinSizel
"centos 7.6的字符有问题，所以用这个替换
"let NERDTreeDirArrowExpandable=">"
"let NERDTreeDirArrowCollapsible="v"
"Directories will appear first alphabetically, followed by files, sorted by timestamp, newest first.
let g:NERDTreeSortOrder=['\/$', '*', '[[-timestamp]]']

"NERDTree END

"Rainbow START
au FileType c,cpp,objc,objcpp call rainbow#load()
"Rainbow END

"Quickfix START
map leader1 :copenCR
map <leader>2 :cclose<CR>
" 异步运行命令时打开 quickfix 窗口，高度为 10 行
"let g:asyncrun_open = 10
"剩下最后一个quickfix自动关闭
aug QFClose 
    au!
    au WinEnter *  if winnr('$') == 1 && &buftype == "quickfix"|q|endif
aug END
"Quickfix END

"Rtags START
"通常rtags配合YouCompleteMe使用
"使用快速修复窗口而不是默认使用的位置列表（location list）
let g:rtagsUseLocationList = 0
"Rtags END

"SyntaxAttr START
"调色工具
nnoremap <Leader>sa :call SyntaxAttr()<CR>
"SyntaxAttr END

"Tagbar START
nmap <F3> :TagbarToggle<CR>
"let g:tagbar_width=40
"Tagbar END

"Table-mode START
"Markdown 里的表格撰写
let b:table_mode_corner = '|'
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'
"Table-mode END

"Visual START
"对visual选中内容可以直接搜索
xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>
function! s:VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction
"Visual END

"UndoTree START
nnoremap <F4> :UndotreeToggle<CR>
"UndoTree END

"YouCompleteMe START
nnoremap <Leader>fi :YcmCompleter FixIt<CR>
nnoremap <Leader>gt :YcmCompleter GoTo<CR>
nnoremap <Leader>gd :YcmCompleter GoToDefinition<CR>
nnoremap <Leader>gh :YcmCompleter GoToDeclaration<CR>
nnoremap <Leader>gr :YcmCompleter GoToReferences<CR>
"关掉光标悬停的提示
let g:ycm_auto_hover = ''
"写注释的时候也能启用自动完成
let g:ycm_complete_in_comments = 1
"仅对白名单列表里的文件类型才启用 YCM
let g:ycm_filetype_whitelist = {
      \ 'c': 1,
      \ 'cpp': 1,
      \ 'python': 1,
      \ 'sh': 1,
      \ 'zsh': 1,
      \ }
"当跳转的目的文件尚未打开时，用分割窗口的方式打开新文件；如果已经打开则跳转到相应的窗口
let g:ycm_goto_buffer_command = 'split-or-existing-window'
"来定义手工启用语义完成的按键。在你输入时，YCM
"会自动尝试标识符匹配，而当你输入 .、->、:: 或这个按键时，YCM
"则会启用语义完成，来给出当前上下文中允许出现的符号。这个按键默认是
"，在某些操作系统上是不能用的（如 Mac 和老的 Windows），所以我改成了
let g:ycm_key_invoke_completion = '<C-Z>'
"YouCompleteMe END
 
"打开文件自动回到上次的退出的行
"autocmd BufReadPost *
     "\   echo("hello") |
     ""\ if line("'\"") > 0 && line("'\"") <= line("$") |
     "\   exe "normal! g`\"" |
     ""\ endif
autocmd BufReadPost * normal! g`"zv 
"autocmd BufReadPost * silent! normal! g`"zv


au FileType java	           colo morning
"au FileType c,cpp,objc,objcpp     colo morning 
