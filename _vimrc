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

function! StripTrailingWhite()
    silent! %s/\s\+$//
endfunction

autocmd BufWritePre,FileWritePre * :call StripTrailingWhite()

"" Out of the brackets
"func SkipPair()
"    if getline('.')[col('.') - 1] == ')' || getline('.')[col('.') - 1] == ']' || getline('.')[col('.') - 1] == '"' || getline('.')[col('.') - 1] == "'" || getline('.')[col('.') - 1] == '}'
"        return "\<ESC>la"
"    else
"        return "\t"
"    endif
"endfunc
"inoremap <TAB> <c-r>=SkipPair()<CR>

"}}}

" 快捷键设置{{{

map <silent> eh :nohlsearch<CR>
map <silent> es :split<CR>
map <silent> ev :vsplit<CR>
map <silent> eg :!/usr/bin/git log --stat %<CR>
map <silent> eG :echo system('/usr/bin/git blame '.expand('%').' -p -L '.line('.').','.line('.'))<CR>
map <silent> en :NERDTreeToggle<CR>
map <silent> em :TlistToggle<CR>
map ee <C-]>             " 跳转到定义
map E <C-t>              " 返回查找
map <silent> eo <C-o><CR>" 返回查找
map <silent> ewq :wq<CR> " 定义快捷键关闭当前分割窗口
map <silent> eq :q<CR>   " 定义快捷键关闭当前分割窗口
map <silent> eQ :q!<CR>  " 定义快捷键关闭当前分割窗口
map <silent> ew :w<CR>   " 定义快捷键保存当前窗口内容
"nmap <leader>qa :qa!<CR> " 不做任何保存，直接退出 vim
nnoremap nw <C-W><C-W>   " 依次遍历子窗口
nnoremap <C-l> <C-W>l    " 跳转至右方的窗口
nnoremap <C-k> <C-W>k    " 跳转至上方的子窗口
nnoremap <C-j> <C-W>j    " 跳转至下方的子窗口
nnoremap <C-h> <C-W>h    " 跳转至左方的窗口
set pastetoggle=<F8>     " 粘贴模式

inoremap jj <esc>
nmap <leader><leader> :
nmap <leader>g :!/usr/bin/git blame %<CR>
command! W :w !sudo tee %

"}}}

" 配色方案{{{
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
map <C-RETURN> :bnext<CR>
nnoremap <C-S-RETURN> :bprevious<CR>
map bn :bnext<cr>
map bp :bprevious<cr>
map bf :bfirst<cr>
map bl :blast<cr>
map bd :bp <BAR> bd #<CR>
"nnoremap bl :ls<CR>
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
map tp :tabprevious<cr>
map tn :tabnext<cr>
map td :tabnew .<cr>
map te :tabedit <CR>
map to :tabonly<CR>
map tc :tabclose<cr>
"}}}

" set fileformats=unix,dos,mac {{{
nmap <leader>fw :se fileformat=dos<CR>
nmap <leader>fu :se fileformat=unix<CR>
"}}}

" 插件管理vundle {{{
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'                " 插件管理
Plugin 'scrooloose/nerdtree'              " 目录树
Plugin 'taglist.vim'                      " 标签列表插件
Plugin 'scrooloose/syntastic'             " 语法检测插件
Plugin 'airblade/vim-gitgutter'           " git插件
Plugin 'bling/vim-airline'                " 状态栏插件
Plugin 'terryma/vim-multiple-cursors'     " 多行编辑插件
Plugin 'tomasr/molokai'                   " 主题
Plugin 'mattn/emmet-vim'                  " 前端编辑插
Plugin 'mhinz/vim-startify'               " 开始页面
Plugin 'scrooloose/nerdcommenter'         " 注释插件
Plugin 'bash-support.vim'                 " bash脚本插件
Plugin 'Lokaltog/vim-easymotion'          " 快速移动插件
Plugin 'plasticboy/vim-markdown'          " markdown
Plugin 'sjl/gundo.vim'                    " undolist
"Plugin 'autocomplpop'                     " 补全提示
Plugin 'kana/vim-smartinput'              " 智能输入
Plugin 'tpope/vim-surround'               " 闭合处理
Plugin 'kien/ctrlp.vim'                   " 文件搜索
Plugin 'craigemery/vim-autotag'           " 自动更新tags
Plugin 'altercation/vim-colors-solarized' " 主题配色
Plugin 'PDV--phpDocumentor-for-Vim'       " php方法注释
Plugin 'brookhong/DBGPavim'               " 断点调试
Plugin 'stephpy/vim-php-cs-fixer'         " psr代码风格修复
Plugin 'godlygeek/tabular'                " 对齐
Plugin 'mileszs/ack.vim'                  " 搜索插件
Plugin 'dyng/ctrlsf.vim'                  "
Plugin 'tpope/vim-repeat'                 "
Plugin 'exvim/ex-searchcompl'             "
Plugin 'thinca/vim-quickrun'              " 快速执行
Plugin 'pthrasher/conqueterm-vim'         " shell
Plugin 'Yggdroot/indentLine'              " 标线
Plugin 'dkprice/vim-easygrep'             " easygrep
"Plugin 'ervandew/snipmate.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
"Plugin 'ervandew/supertab'                " tab
"Plugin 'vim-scripts/vawa.vim'             " 高亮当前光标变量
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'vim-scripts/php_localvarcheck.vim'
"Plugin 'joonty/vim-phpqa'
Plugin 'junegunn/vim-easy-align'

call vundle#end()            " required
filetype plugin indent on    " required
set completeopt=longest,menu
au FileType php set omnifunc=phpcomplete#CompletePHP
" You might also find this useful
" PHP Generated Code Highlights (HTML & SQL)

let php_sql_query=1
let php_htmlInStrings=1

" Hope this helps!

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
"nnoremap <silent><F2> :NERDTreeToggle<CR>
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
let Tlist_Auto_Update = 1
let Tlist_Close_On_Select=1
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Hightlight_Tag_On_BufEnter = 1
let Tlist_Exit_OnlyWindow=1
"let Tlist_Enable_Fold_Column = 0
"let Tlist_Process_File_Always = 1
"let Tlist_Display_Prototype = 0
"let Tlist_Compact_Format = 1
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
nmap f <Plug>(easymotion-s)

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
let g:ctrlp_working_path_mode= 'ra'
" Use a leader instead of the actual named binding
nmap <leader>p :CtrlP<cr>
" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap el :BuffergatorOpen<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>br :CtrlPMRU<cr>
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_open_multiple_files = 'v'         " <C-Z><C-O>时垂直分屏打开多个文件
let g:ctrlp_match_window_bottom= 1
let g:ctrlp_match_window_reversed=0
let g:ctrlp_max_height= 100
let g:ctrlp_mruf_max=1000
let g:ctrlp_follow_symlinks=1"
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif,*.js,*.html,*.css,*.log "MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files.
  let g:ctrlp_user_command = 'ag %s -l --php --nocolor -g ""'
  " Ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
let g:ackprg = 'ag --nogroup --nocolor --column'
"let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

"}}}

" DBGPavim=断点高度工具 {{{
map <leader>dd :Dp<cr>
map <leader>di <F2>
map <leader>dr <F5>
map <leader>dp <F12>
map <leader>ds <F6>
map <leader>dn <F3>
map <leader>db <F10>
map <leader>dv <F11>

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
nmap <Leader>aa :Tabularize /=><CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
nmap <Leader>a" :Tabularize /"<CR>
" }}}

" CtrlSF=在文件中查找 {{{
let g:ctrlsf_default_root = 'project'
let g:ctrlsf_indent = 2
let g:ctrlsf_ackprg = 'ag'
let g:ackprg='ag --nogroup --nocolor --column --php --html'
nmap <leader>s :CtrlSF -filetype php <c-r><c-w><CR>
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

"SuperTab {{{
"let g:SuperTabMappingForward = '<s-tab>'
"}}}

"startify {{{
let g:startify_bookmarks = [
        \'/home/dev/git/firstp2p/'
    \]

" }}}

"syntasic {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_php_checkers = ['php', 'phpmd --minimumpriority']
let g:syntastic_aggregate_errors = 1
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
"}}}

"markdown{{{
let g:vim_markdown_folding_disabled = 1
"}}}

"}}}

