" 配置说明{{{
" =============================================
" @author wangshijie<wangshihchieh@sina.com>
" =============================================
" }}}

" 基本配置{{{
syntax on                      " 自动语法高亮
set number                     " 显示行号
set mouse=a                    " 鼠标直接定位光标
set shiftwidth=4               " 设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=4              " 使得按退格键时可以一次删掉 4 个空格
set expandtab                  " tab用空格标示
set tabstop=4                  " 设定 tab 长度为 4
set nobackup                   " 覆盖文件时不备份
set autochdir                  " 自动切换当前目录为当前文件所在的目录
set backupcopy=yes             " 设置备份时的行为为覆盖
set ignorecase smartcase       " 智能搜索搜索
set incsearch                  " 输入搜索内容时就显示搜索结果
set hlsearch                   " 搜索时高亮显示被找到的文本
set noerrorbells               " 关闭错误信息响铃
set novisualbell               " 关闭使用可视响铃代替呼叫
set vb t_vb=                   " 置空错误铃声的终端代码
set showmatch                  " 插入括号时，短暂地跳转到匹配的对应括号
set matchtime=2                " 短暂跳转到匹配括号的时间
set backspace=indent,eol,start " 不设定在插入状态无法用退格键和 Delete 键删除回车符
let mapleader=';'              " 设置触发键
let g:mapleader=';'            " 设置触发键
vnoremap <Leader>y "+y         " 设置快捷键将选中文本块复制至系统剪贴板
set nocompatible               " 关闭 vi 兼容模式
set hidden                     " 避免必须保存修改才可以跳转bufer
set list
set listchars=tab:>-,trail:. " TAB会被显示成 ' >— ' 而行尾多余的空白字符显示 ' . ' 2015-07-22
set autochdir                " 自动切换目录
set tags=tags;               " 递归查找tags
set encoding=utf8
autocmd FileType c,cpp,php set shiftwidth=4 | set expandtab | %retab!

function StripTrailingWhite()
    silent! %s/\s\+$//
endfunction

autocmd BufWritePre,FileWritePre * :call StripTrailingWhite()

"}}}

" 快捷键设置{{{

map <silent> eh :nohlsearch<CR>
map <silent> es :split<CR>
map <silent> ev :vsplit<CR>
map <silent> eg :!/usr/bin/git log --stat %<CR>
map <silent> eG :echo system('/usr/bin/git blame '.expand('%').' -p -L '.line('.').','.line('.'))<CR>
map <silent> en :NERDTreeToggle<CR>
map <silent> em :TlistToggle<CR>
map <silent> edd <F8>:Dox<CR><F8>
map <silent> eda <F8>:DoxAuthor<CR><F8>
map <silent> edc <F8>:DoxLic<CR><F8>
map ee <C-]>             " 跳转到定义
map E <C-t>              " 返回查找
map <silent> ewq :wq<CR> " 定义快捷键关闭当前分割窗口
map <silent> eq :q<CR>   " 定义快捷键关闭当前分割窗口
map <silent> eQ :q!<CR>  " 定义快捷键关闭当前分割窗口
map <silent> ew :w<CR>   " 定义快捷键保存当前窗口内容
nmap <leader>qa :qa!<CR> " 不做任何保存，直接退出 vim
nnoremap nw <C-W><C-W>   " 依次遍历子窗口
nnoremap <C-l> <C-W>l    " 跳转至右方的窗口
nnoremap <C-w> <C-W>h    " 跳转至方的窗口
nnoremap <C-k> <C-W>k    " 跳转至上方的子窗口
nnoremap <C-j> <C-W>j    " 跳转至下方的子窗口
nnoremap <C-l> <C-W>l    " 跳转至右方的窗口
set pastetoggle=<F8>     " 粘贴模式

inoremap jj <esc>
nmap <leader><leader> :<CR>
command W :w !sudo tee %

"}}}

" 配色方案{{{
set background=dark
"colorscheme solarized
"highlight TabLine term=underline cterm=bold ctermfg=9 ctermbg=4
"highlight TabLineSel term=bold cterm=bold ctermbg=Red ctermfg=yellow
"
"highlight Pmenu guibg=#EE0000 ctermbg=darkred
"highlight PmenuSel guibg=#660000 ctermbg=red guifg=yellow ctermfg=yellow
"highlight PmenuSbar guibg=#990000 ctermbg=red
"highlight PmenuThumb guifg=yellow ctermfg=darkred
"
"highlight CursorLine guibg=#2B0000 ctermbg=darkgreen
"highlight LineNr ctermbg=4 ctermfg=6

" }}}

" 状态栏以及配色方案{{{
set laststatus=2
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\[HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
                            " 设置在状态行显示的信息
autocmd BufEnter *.vimrc setlocal foldmethod=marker
"}}}

" Buffers操作快捷方式! {{{
nnoremap <C-RETURN> :bnext<CR>
nnoremap <C-S-RETURN> :bprevious<CR>
map bn :bnext<cr>
map bp :bprevious<cr>
map bf :bfirst<cr>
map bd :bp <BAR> bd #<CR>
nnoremap bl :ls<CR>
" 通过索引快速跳转
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>
autocmd BufEnter *.c call SourceTagsVim()

"}}}

" Tab操作快捷方式! {{{
"nnoremap <C-TAB> :tabnext<CR>
"nnoremap <C-S-TAB> :tabprev<CR>

"关于tab的快捷键
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>td :tabnew .<cr>
map <leader>te :tabedit
map <leader>to :tabonly
map <leader>tc :tabclose<cr>
"}}}

"窗口分割时,进行切换快捷键!{{{
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"}}}

" set fileformats=unix,dos,mac {{{
nmap <leader>fw :se fileformat=dos<CR>
nmap <leader>fu :se fileformat=unix<CR>
"}}}

" TagList 配置{{{
"-----------------------------------------------------------------
" plugin - taglist.vim  查看函数列表，需要ctags程序
" F4 打开隐藏taglist窗口
"-----------------------------------------------------------------
nnoremap <silent><F3> :TlistToggle<CR>
let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window = 1
let g:tlist_php_settings = 'php;c:class;i:interface;d:constant;f:function'

"let Tlist_Auto_Open = 0
"let Tlist_Auto_Update = 1
"let Tlist_Hightlight_Tag_On_BufEnter = 1
"let Tlist_Enable_Fold_Column = 0
"let Tlist_Process_File_Always = 1
"let Tlist_Display_Prototype = 0
"let Tlist_Compact_Format = 1
"}}}

" 插件管理vundle {{{
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'L9'                               " L9
Plugin 'gmarik/Vundle.vim'                " 插件管理
Plugin 'scrooloose/nerdtree'              " 目录树
Plugin 'taglist.vim'                      " 标签列表插件
Plugin 'scrooloose/syntastic'             " 语法检测插件
Plugin 'airblade/vim-gitgutter'           " git插件
Plugin 'bling/vim-airline'                " 状态栏插件
Plugin 'terryma/vim-multiple-cursors'     " 多行编辑插件
Plugin 'tomasr/molokai'                   " 主题
Plugin 'mattn/emmet-vim'                  " 前端编辑插
Plugin 'DoxygenToolkit.vim'               " 注释
Plugin 'mhinz/vim-startify'               " 开始页面
Plugin 'scrooloose/nerdcommenter'         " 注释插件
Plugin 'bash-support.vim'                 " bash脚本插件
Plugin 'Lokaltog/vim-easymotion'          " 快速移动插件
Plugin 'plasticboy/vim-markdown'          " markdown
Plugin 'sjl/gundo.vim'                    " undolist
Plugin 'autocomplpop'                     " 补全提示
Plugin 'kana/vim-smartinput'              " 智能输入
Plugin 'tpope/vim-surround'               " 闭合处理
Plugin 'yegappan/mru'                     " 最近打开的文件
Plugin 'bling/vim-bufferline'             " buffer
Plugin 'jeetsukumaran/vim-buffergator'    " buffer管理
Plugin 'jlanzarotta/bufexplorer'          " buffer
Plugin 'kien/ctrlp.vim'                   " 文件搜索
Plugin 'craigemery/vim-autotag'           " 自动更新tags
Plugin 'altercation/vim-colors-solarized' " 主题配色
Plugin 'PDV--phpDocumentor-for-Vim'       " php方法注释
Plugin 'StanAngeloff/php.vim'             " php标准
Plugin 'brookhong/DBGPavim'               " 断点调试
Plugin 'stephpy/vim-php-cs-fixer'         " psr代码风格修复
Plugin 'godlygeek/tabular'                " 对齐
Plugin 'Valloric/YouCompleteMe'           " 自动补全插件
Plugin 'shawncplus/phpcomplete.vim'       " php自动补全
Plugin 'mileszs/ack.vim'                  " 搜索插件
Plugin 'dyng/ctrlsf.vim'                  "
Plugin 'tpope/vim-repeat'                 "
Plugin 'exvim/ex-searchcompl'             "

call vundle#end()            " required
filetype plugin indent on    " required
" }}}

" php代码调试{{{
map <leader>v :set paste<cr>yawoerror_log(print_r("\n<esc>pa\033[32m=error::shijie===>>".__CLASS__."->".__FUNCTION__."<<========================>>>>> \033[0m \n", true), 3, "/tmp/shijie.log");<ESC>oerror_log(print_r($<esc>pa, true), 3, "/tmp/shijie.log");<esc>,w:set nopaste<cr>

map <leader>z :set paste<cr>oini_set("display_errors", 1);<cr>error_reporting(E_ALL);<cr><esc>

set background=dark
colorscheme solarized
let g:rehash256 = 1
"}}}

" 忽略文件 {{{
" Ignore file config
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/Library/**,*/.rbenv/**
set wildignore+=*/.nx/**,*.app,*.git,.git
" }}}

" NerdTree 配置! {{{
"-----------------------------------------------------------------
" plugin - NERD_tree.vim 以树状方式浏览系统中的文件和目录
" :ERDtree 打开NERD_tree         :NERDtreeClose    关闭NERD_tree
" o 打开关闭文件或者目录         t 在标签页中打开
" T 在后台标签页中打开           ! 执行此文件
" p 到上层目录                   P 到根目录
" K 到第一个节点                 J 到最后一个节点
" u 打开上层目录                 m 显示文件系统菜单（添加、删除、移动操作）
" r 递归刷新当前目录             R 递归刷新当前根目录
"-----------------------------------------------------------------
" F3 NERDTree 切换
nnoremap <silent><F2> :NERDTreeToggle<CR>
" 在 vim 启动的时候默认开启 NERDTree（autocmd 可以缩写为 au）
" autocmd VimEnter * NERDTreeToggle
" 按下 F2 调出/隐藏 NERDTree
"map  :silent! NERDTreeToggle
" 将 NERDTree 的窗口设置在 vim 窗口的右侧（默认为左侧）
" let NERDTreeWinPos="right"
" 当打开 NERDTree 窗口时，自动显示 Bookmarks
let NERDTreeShowBookmarks=1
"}}}

" 插件配置{{{

" YouCompleteMe 配置 {{{
" YouCompleteMe 功能
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
" 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 引入 C++ 标准库tags，这个没有也没关系，只要.ycm_extra_conf.py文件中指定了正确的标准库路径
set tags+=/data/misc/software/misc./vim/stdcpp.tags
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>; <C-x><C-o>
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
" 修改对C函数的补全快捷键，默认是CTRL + space，修改为ALT + ;
let g:ycm_key_invoke_completion = '<M-;>'
" 设置转到定义处的快捷键为ALT + G，这个功能非常赞
nmap <M-g> :YcmCompleter GoToDefinitionElseDeclaration <C-R>=expand("<cword>")<CR><CR>
" }}}

" DoxygenToolkit=文档注释配置 {{{
let g:doxygenToolkit_authorName="Wang Shi Jie<wangshijie@ucfgroup.com>"
let g:DoxygenToolkit_ckommentType="PHP"
let g:DoxygenToolkit_briefTag_pre="@synopsis "
let g:DoxygenToolkit_paramTag_pre="@param "
let g:DoxygenToolkit_returnTag="@returns "
"let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
"let g:DoxygenToolkit_blockFooter="--------------------------------------------------------------------------"
let g:DoxygenToolkit_licenseTag = ''

let s:licenseTag = "\<enter>www.firstp2p.com\<enter>"
let s:licenseTag = s:licenseTag . "All right reserved\<enter>"
let s:licenseTag = s:licenseTag . "\<enter>Copyright(C)\<enter>"
let g:DoxygenToolkit_briefTag_funcName="no"
let g:doxygen_enhanced_color=1

let g:DoxygenToolkit_startCommentTag = "/**"
let g:DoxygenToolkit_interCommentTag = " * "
let g:DoxygenToolkit_endCommentTag = " */"
let g:DoxygenToolkit_startCommentBlock = "/**"
let g:DoxygenToolkit_interCommentBlock = " * "
let g:DoxygenToolkit_endCommentBlock = " */"

"}}}

" easymotion=快速移动配置 {{{
"let g:EasyMotion_leader_key = 'f'
let g:EasyMotion_do_mapping = 0

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap f <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap f <Plug>(easymotion-s2)

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
" }}}

" airline=状态栏配置 {{{
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 0
" }}}

" CtrlP=查找文件配置 {{{
" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'
" Use a leader instead of the actual named binding
nmap <leader>p :CtrlP<cr>
" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>br :CtrlPMRU<cr>
"}}}

" DBGPavim=断点高度工具 {{{
map <leader>dd :Dp<cr>
map <leader>di <F2>
map <leader>dr <F5>
map <leader>dp <F12>
map <leader>ds <F6><F6>
map <leader>dn <F3>
map <leader>db <F10>

let g:dbgPavimPort = 9009
let g:dbgPavimBreakAtEntry = 0
"}}}

" php doc 插件相关配置 {{{
nnoremap <C-Y> :call PhpDocSingle()<CR>
vnoremap <C-Y> :call PhpDocRange()<CR>
"}}}

" Tabuarize 配置 {{{
let mapleader=';'
nmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
nmap <Leader>a" :Tabularize /"<CR>
" }}}

" CtrlSF=在文件中查找 {{{
let g:ctrlsf_default_root = 'project'
let g:ctrlsf_indent = 2
let g:ctrlsf_ackprg = 'ack'
let g:ackprg='ack --type=php'
nmap <leader>s :CtrlSF -filetype php
nmap     <C-F> <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFToggle<CR>
" }}}

"php-cs-fixer=PSR规则修正{{{

" If php-cs-fixer is in $PATH, you don't need to define line below
" let g:php_cs_fixer_path = "~/php-cs-fixer.phar" " define the path to the php-cs-fixer.phar
let g:php_cs_fixer_level = "symfony"              " which level ?
let g:php_cs_fixer_config = "default"             " configuration
let g:php_cs_fixer_php_path = "php"               " Path to PHP
" If you want to define specific fixers:
"let g:php_cs_fixer_fixers_list = "linefeed,short_tag,indentation"
let g:php_cs_fixer_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                    " Call command with dry-run option
let g:php_cs_fixer_verbose = 0                    " Return the output of command if 1, else an inline information.

nnoremap <silent><leader>fd :call PhpCsFixerFixDirectory()<CR>
nnoremap <silent><leader>ff :call PhpCsFixerFixFile()<CR>

"}}}

" }}}

