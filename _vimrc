" 配置说明{{{
" }}}

" 基本配置{{{
syntax on                   " 自动语法高亮
"colorscheme molokai        " 设定配色方案
set number                  " 显示行号
set mouse=a                 " 鼠标直接定位光标
set shiftwidth=4            " 设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=4           " 使得按退格键时可以一次删掉 4 个空格
set expandtab               "tab用空格标示
set tabstop=4               " 设定 tab 长度为 4
set nobackup                " 覆盖文件时不备份
set autochdir               " 自动切换当前目录为当前文件所在的目录
set backupcopy=yes          " 设置备份时的行为为覆盖
set ignorecase smartcase    " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
"set nowrapscan              " 禁止在搜索到文件两端时重新搜索
set incsearch               " 输入搜索内容时就显示搜索结果
set hlsearch                " 搜索时高亮显示被找到的文本
set noerrorbells            " 关闭错误信息响铃
set novisualbell            " 关闭使用可视响铃代替呼叫
set vb t_vb=                   " 置空错误铃声的终端代码
set showmatch               " 插入括号时，短暂地跳转到匹配的对应括号
set matchtime=2             " 短暂跳转到匹配括号的时间
set hidden                  " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
set smartindent             " 开启新行时使用智能自动缩进
set backspace=indent,eol,start " 不设定在插入状态无法用退格键和 Delete 键删除回车符
"}}}

let g:mapleader=';'
vnoremap <Leader>y "+y      " 设置快捷键将选中文本块复制至系统剪贴板
nmap <Leader>p "+p          " 设置快捷键将系统剪贴板内容粘贴至

" 快捷键设置{{{

map <silent> eh :tabprevious<CR>
map <silent> el :tabnext<CR>
map <silent> eH :TabmovePrevious<CR>
map <silent> eL :TabmoveNext<CR>
map <silent> eN :nohlsearch<CR>
map <silent> et o-------------------- <C-R>=strftime('%Y-%m-%d %H:%M:%S')<CR> --------------------<CR>
map <silent> es :split<CR>
map <silent> eS :vsplit<CR>
"map <silent> ew :set nowrap!<CR>
map <silent> eg :!/usr/bin/git log --stat %<CR>
map <silent> eG :echo system('/usr/bin/git blame '.expand('%').' -p -L '.line('.').','.line('.'))<CR>
map <silent> en :NERDTreeToggle<CR>
map <silent> em :TlistToggle<CR>
map <silent> ei <c-w>w
map <silent> eI :set list!<CR>
map <silent> ed :Dox<CR>
map <silent> ea :DoxAuthor<CR>
map <silent> ec :DoxLic<CR>
map ee <C-]>  " 跳转到定义
map E <C-t>   " 返回查找

map <silent> ewq :wq<CR>       " 定义快捷键关闭当前分割窗口
map <silent> eq :q<CR>       " 定义快捷键关闭当前分割窗口
map <silent> eQ :q!<CR>       " 定义快捷键关闭当前分割窗口
map <silent> ew :w<CR>       " 定义快捷键保存当前窗口内容
nmap <leader>qa :qa!<CR>     " 不做任何保存，直接退出 vim
nnoremap nw <C-W><C-W>      " 依次遍历子窗口
nnoremap <Leader>lw <C-W>l  " 跳转至右方的窗口
nnoremap <Leader>hw <C-W>h  " 跳转至方的窗口
nnoremap <Leader>kw <C-W>k  " 跳转至上方的子窗口
nnoremap <Leader>jw <C-W>j  " 跳转至下方的子窗口
nnoremap <Leader>lw <C-W>l  " 跳转至右方的窗口
set nocompatible            " 关闭 vi 兼容模式
set list
set listchars=tab:>-,trail:."TAB会被显示成 ">—" 而行尾多余的空白字符显示"." 2015-07-22
set pastetoggle=<F8>

set hidden " 避免必须保存修改才可以跳转buffer

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

" 设置vim更改配置后立即生效{{{
if has("autocmd")
    autocmd! bufwritepost vimrc source ~/.vimrc
endif
"}}}

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
map bd :bdelete<cr>
" 查看buffers
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
nmap <leader>fd :se fileformat=dos<CR>
nmap <leader>fu :se fileformat=unix<CR>
"}}}

" Python 文件的一般设置{{{
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab
autocmd FileType python map <F12> :!python %<CR>
"}}}

"搜索所有文件名 FileFinder.vim {{{
"2014.8.13
"命令
" :FileFinderShow   显示目录下所有文件
" :map ea :FileFinderShow<CR> 绑定一个快捷键
"快捷键
" Enter             当前窗口打开文件
" t                 新窗口打开文件
" d                 删除文件
" q                 退出FileFinder
" r                 刷新
" R                 运行命令
"配置
" g:FileFinder_Name = 'File_Finder' 标签名称
" g:FileFinder_RunWithLess = 1 运行命令后是否加less
"@author quanhengzhuang
if exists('g:loaded_filefinder')
    "finish
endif
let g:loaded_filefinder = 1

command! -nargs=? FileFinderShow call s:FileFinder_Show(<f-args>)

autocmd BufEnter *.filefinder call FileFinder_Refresh()

let g:FileFinder_Name = 'File_Finder'

let g:FileFinder_RunWithLess = 1

let g:FileFinder_Count = 0

let b:FileFinder_Cwd = ''

function! s:FileFinder_Show(...)
    if bufname('%') != '' || byte2line(1) != -1
        tabnew
    endif

    let g:FileFinder_Count += 1
    silent! execute 'file '.g:FileFinder_Name.'_'.g:FileFinder_Count

    let cmd = 'find ./ -type f | grep -i -v "/\." | sort'
    if a:0 == 1
        let cmd = cmd.' | grep '.a:1
    endif

    call s:FileFinder_Execute(cmd)

    call s:FileFinder_SetLocal()
    call s:FileFinder_SetMaps()
endfunction

function! s:FileFinder_Execute(cmd)
    let b:FileFinder_Cwd = getcwd()
    let current = getpos('.')
    0,$ delete
    execute '0 read !'.a:cmd
    $,$ delete
    call setpos('.', current)
endfunction

let s:FileFinder_Count = [[], 0]
function! FileFinder_ShowSearchCount()
    let key = [@/, b:changedtick]
    if s:FileFinder_Count[0] !=# key
        let s:FileFinder_Count = [key, 0]
        let pos = getpos('.')
        let subscount = "0"
        try
            redir => subscount | silent %s///gne | redir END
        catch
        endtry
        call setpos('.', pos)
        let s:FileFinder_Count[1] = str2nr(matchstr(subscount, '\d\+'))
    endif
    return '<'.s:FileFinder_Count[1].'> '.@/
endfunction

function! s:FileFinder_SetLocal()
    setfiletype filefinder
    setlocal nobuflisted
    setlocal buftype=nofile
    setlocal noswapfile
    setlocal nomodifiable
    setlocal cursorline

    setlocal statusline=%{b:FileFinder_Cwd}
    setlocal statusline+=\ <%L>\ Files
    setlocal statusline+=\ %{FileFinder_ShowSearchCount()}
endfunction

function! s:FileFinder_SetMaps()
    map <buffer> <CR> :execute 'edit '.simplify(b:FileFinder_Cwd.'/'.getline('.'))<CR>
    map <buffer> t :execute 'tabnew '.simplify(b:FileFinder_Cwd.'/'.getline('.'))<CR>
    map <buffer> q :quit<CR>
    map <buffer> d :call FileFinder_DeleteHere()<CR>
    map <buffer> c :call FileFinder_CopyHere()<CR>
    map <buffer> m :call FileFinder_MoveHere()<CR>
    map <buffer> r :call FileFinder_Refresh()<CR>
    map <buffer> R :call FileFinder_RunHere()<CR>
endfunction

function! FileFinder_Refresh()
    let cmd = 'find ./ -type f | grep -v "/\." | sort'
    setlocal modifiable
    call s:FileFinder_Execute(cmd)
    setlocal nomodifiable
endfunction

function! FileFinder_DeleteHere()
    let filename = simplify(b:FileFinder_Cwd.'/'.getline('.'))
    if confirm('Delete file "'.filename.'"?', "yes\nno", 2) != 1
        return
    endif

    if delete(filename) != 0
        echo '删除失败'
        return
    endif

    echo '删除成功'
    setlocal modifiable | delete | setlocal nomodifiable
    return
endfunction

function! FileFinder_CopyHere()
    let filename = simplify(b:FileFinder_Cwd.'/'.getline('.'))
    echohl Title
    let target = input('Copy to: ', filename)
    echohl None

    let cmd = 'cp -f '.filename.' '.target
    call system(cmd)
    call FileFinder_Refresh()
endfunction

function! FileFinder_MoveHere()
    let filename = simplify(b:FileFinder_Cwd.'/'.getline('.'))
    echohl Title
    let target = input('Move to: ', filename)
    echohl None

    let cmd = 'mv -f '.filename.' '.target
    call system(cmd)
    call FileFinder_Refresh()
endfunction

function! FileFinder_RunHere()
    let filename = simplify(b:FileFinder_Cwd.'/'.getline('.'))
    execute '!'.filename.(g:FileFinder_RunWithLess ? ' | less' : '')
endfunction
"}}}

" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y

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

set autochdir
set tags=tags;

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

" 插件管理vundle {{{
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'L9'
Plugin 'gmarik/Vundle.vim'               " 插件管理
Plugin 'scrooloose/nerdtree'             " 目录树
Plugin 'taglist.vim'                     " 标签列表插件
Plugin 'scrooloose/syntastic'            " 语法检测插件
Plugin 'airblade/vim-gitgutter'          " git插件
Plugin 'bling/vim-airline'               " 状态栏插件
Plugin 'redguardtoo/evil-nerd-commenter' "
Plugin 'terryma/vim-multiple-cursors'    " 多行编辑插件
Plugin 'tomasr/molokai'                  " 主题
Plugin 'mattn/emmet-vim'                 " 前端编辑插
Plugin 'DoxygenToolkit.vim'              " 注释
Plugin 'mhinz/vim-startify'              " 开始页面
Plugin 'scrooloose/nerdcommenter'        " 注释插件
Plugin 'bash-support.vim'                " bash脚本插件
Plugin 'Lokaltog/vim-easymotion'         " 快速移动插件
Plugin 'plasticboy/vim-markdown'         " markdown
Plugin 'sjl/gundo.vim'                   " undolist
Plugin 'ervandew/supertab'               " supertab
Plugin 'autocomplpop'                    " 补全提示
Plugin 'godlygeek/tabular'               " 对齐插件
Plugin 'kana/vim-smartinput'             " 只能输入
Plugin 'tpope/vim-surround'              " 闭合处理
Plugin 'yegappan/mru'                    " 最近打开的文件
Plugin 'bling/vim-bufferline'
Plugin 'jeetsukumaran/vim-buffergator'
"Plugin 'drmingdrmer/vim-tabbar'          " tab
Plugin 'jlanzarotta/bufexplorer' " buffer
Plugin 'kien/ctrlp.vim'
Plugin 'craigemery/vim-autotag' "自动更新tags
Plugin 'altercation/vim-colors-solarized'
"Plugin 'UltiSnips'
"Plugin 'shawncplus/phpcomplete.vim'
"Plugin 'eikenb/acp'
"Plugin 'othree/vim-autocomplpop'

call vundle#end()            " required
filetype plugin indent on    " required
" }}}

"let g:molokai_original = 1
syntax enable
set background=dark
colorscheme solarized
let g:rehash256 = 1

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

" 插件配置{{{
" DoxygenToolkit
let g:doxygenToolkit_authorName="Wang Shi Jie<wangshijie@ucfgroup.com>"
let g:DoxygenToolkit_commentType="PHP"
let g:DoxygenToolkit_briefTag_pre="@synopsis "
let g:DoxygenToolkit_paramTag_pre="@param\t"
let g:DoxygenToolkit_returnTag="@returns\t"
"let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
"let g:DoxygenToolkit_blockFooter="--------------------------------------------------------------------------"
let g:DoxygenToolkit_licenseTag = ''

let s:licenseTag = "\<enter>www.firstp2p.com\<enter>"
let s:licenseTag = s:licenseTag . "All right reserved\<enter>"
let s:licenseTag = s:licenseTag . "\<enter>Copyright(C)\<enter>"
let g:DoxygenToolkit_briefTag_funcName="no"
let g:doxygen_enhanced_color=1

let g:DoxygenToolkit_startCommentTag = "/**"
let g:DoxygenToolkit_startCommentBlock = "/**"
let g:DoxygenToolkit_interCommentBlock = " * "
let g:DoxygenToolkit_interCommentTag = " * "
let g:DoxygenToolkit_endCommentTag = " */"
let g:DoxygenToolkit_endCommentBlock = " */"

"nnoremap ; :
"nnoremap : ;
xnoremap p pgvy

"" easymotion
let g:mapleader = ';'
let g:EasyMotion_leader_key = ';'
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>f <Plug>(easymotion-f)
map <Leader>F <Plug>(easymotion-F)
map <Leader>t <Plug>(easymotion-t)
map <Leader>T <Plug>(easymotion-T)
map <Leader>w <Plug>(easymotion-w)
map <Leader>W <Plug>(easymotion-W)
map <Leader>b <Plug>(easymotion-b)
map <Leader>B <Plug>(easymotion-B)
"map <Leader>e <Plug>(easymotion-e)
"map <Leader>E <Plug>(easymotion-E)
"map <Leader>ge <Plug>(easymotion-ge)
"map <Leader>gE <Plug>(easymotion-gE)
map <Leader>n <Plug>(easymotion-n)
map <Leader>N <Plug>(easymotion-N)
map <Leader>s <Plug>(easymotion-s)



" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"tabular 对齐插件
let g:tabular_loaded = 1

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden
" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>
" Move to the next buffer
nmap <leader>l :bnext<CR>
" Move to the previous buffer
nmap <leader>h :bprevious<CR>
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>
" Show all open buffers and their status
nmap <leader>bl :ls<CR>
" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

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
" }}}
