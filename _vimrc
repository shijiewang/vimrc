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

let g:mapleader=','
vnoremap <Leader>y "+y      " 设置快捷键将选中文本块复制至系统剪贴板
nmap <Leader>p "+p          " 设置快捷键将系统剪贴板内容粘贴至

" 快捷键设置{{{

map <silent> eh :tabprevious<CR>
nnoremap <silent><F3> :TlistToggle<CR>
map <silent> el :tabnext<CR>
map <silent> eH :TabmovePrevious<CR>
map <silent> eL :TabmoveNext<CR>
map <silent> eN :nohlsearch<CR>
map <silent> et o-------------------- <C-R>=strftime('%Y-%m-%d %H:%M:%S')<CR> --------------------<CR>
map <silent> es :split<CR>
map <silent> eS :vsplit<CR>
map <silent> ew :set nowrap!<CR>
map <silent> eg :!/usr/bin/git log --stat %<CR>
map <silent> eG :echo system('/usr/bin/git blame '.expand('%').' -p -L '.line('.').','.line('.'))<CR>
map <silent> en :NERDTreeToggle<CR>
map <silent> em :TlistToggle<CR>
map <silent> ei <c-w>w
map <silent> eI :set list!<CR>
map <silent> ed :Dox<CR>
map <silent> ea :DoxAuthor<CR>
map <silent> ec :DoxLic<CR>


map <silent> eq :q<CR>       " 定义快捷键关闭当前分割窗口
map <silent> eQ :q!<CR>       " 定义快捷键关闭当前分割窗口
nmap <leader>w :w<CR>       " 定义快捷键保存当前窗口内容
nmap <Leader>WQ :wa<CR>:q<CR>" 定义快捷键保存所有窗口内容并退出 vim
nmap <leader>qa :qa!<CR>     " 不做任何保存，直接退出 vim
nnoremap nw <C-W><C-W>      " 依次遍历子窗口
nnoremap <Leader>lw <C-W>l  " 跳转至右方的窗口
nnoremap <Leader>hw <C-W>h  " 跳转至方的窗口
nnoremap <Leader>kw <C-W>k  " 跳转至上方的子窗口
nnoremap <Leader>jw <C-W>j  " 跳转至下方的子窗口
nmap <Leader>pa %           " 定义快捷键在结对符之间跳转，助记pair
nnoremap <Leader>ee <C-]>  " 跳转到定义
nnoremap <Leader>E <C-t>  " 返回
set nocompatible            " 关闭 vi 兼容模式
set list
set listchars=tab:>-,trail:."TAB会被显示成 ">—" 而行尾多余的空白字符显示"." 2015-07-22
set pastetoggle=<F8>
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
map bl :blast<cr>
map bf :bfirst<cr>
map bd :bdelete<cr>
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

"搜索Tags SearchTags.vim {{{
"2014.8.10 搜索，新窗口打开
"参考:
"http://andrewradev.com/2011/06/08/vim-and-ctags/
"http://www.vim.org/scripts/script.php?script_id=3771
"差异点：同时搜索函数、类、常量等, pattern优化, 生成tags命令
"差异点：判断是行号还是pattern, 新tab打开
"2014.8.11 增加单词高亮, 智能识别cmd
"2014.8.12 增加zz，将搜索结果置中
"@author quanhengzhuang
if exists('g:loaded_search_tags')
    "finish
endif
let g:loaded_search_tags = 1

"快捷键ee搜索当前单词
map ee :call FindInTaglistHere()<CR>
map E :call FindInTaglistInsightHere()<CR>

"搜索命令、生成tags命令
command! -nargs=1 F call s:FindInTaglist(<f-args>)
command! -nargs=? Fmake call s:TaglistMake(<f-args>)

"匹配关键词的高亮设置
highlight SEARCH_TAGS_NAME ctermbg=5 ctermfg=0

let g:TagInsight_PreviewWindow = 0

function! FindInTaglistHere()
    call s:FindInTaglist(expand('<cword>'))
endfunction

function! FindInTaglistInsightHere()
    call s:FindInTaglistInsight(expand('<cword>'))
endfunction

function! s:TaglistMake(...)
    let cmd = 'ctags -R'
    if (a:0 == 1)
        let cmd = cmd.' --languages='.a:1
    endif
    echohl WarningMsg | echo '正在生成tags... ('.cmd.')' | echohl None
    call system(cmd)
    echohl WarningMsg | echo '生成完成. ('.cmd.')' | echohl None
endfunction

function! s:FindInTaglist(name)
    if (empty(tagfiles()))
        echohl WarningMsg | echo '没有找到tags文件, 请确认pwd下有tags文件' | echohl None
        return
    endif

    let tags = taglist('^'.a:name.'$')
    let tags = filter(tags, 'v:val["kind"] != "v"')

    if (empty(tags))
        echohl WarningMsg | echo '没有找到相关的定义' | echohl None
        return
    endif

    "设置quickfix
    let quickfix = []
    for i in tags
        if (str2nr(i.cmd) > 0 && strlen(i.cmd) == strlen(str2nr(i.cmd)))
            call add(quickfix, {'lnum' : i.cmd, 'filename' : i.filename, 'text' : i.kind})
        else
            let pattern = strpart(i.cmd, 2, strlen(i.cmd) - 4)
            let pattern = escape(pattern, '*[]')
            call add(quickfix, {'pattern' : pattern, 'filename' : i.filename, 'text' : i.kind})
        endif
    endfor
    call setqflist(quickfix)

    tabnew
    "tabdo cclose
    copen
    set nowrap
    execute 'resize '.(len(quickfix) < 5 ? 5 : 10)
    cfirst
    execute 'normal zz'
    call matchadd('SEARCH_TAGS_NAME', '\<'.a:name.'\>')
endfunction

function! s:FindInTaglistInsight(name)
    if (empty(tagfiles()))
        echohl WarningMsg | echo '没有找到tags文件, 请确认pwd下有tags文件' | echohl None
        return
    endif

    let tags = taglist('^'.a:name.'$')
    let tags = filter(tags, 'v:val["kind"] != "v"')

    if (empty(tags))
        echohl WarningMsg | echo '没有找到相关的定义' | echohl None
        return
    endif

    call matchadd('SEARCH_TAGS_NAME', '\<'.a:name.'\>')

    "设置quickfix
    let quickfix = []
    for i in tags
        if (str2nr(i.cmd) > 0 && strlen(i.cmd) == strlen(str2nr(i.cmd)))
            call add(quickfix, {'lnum' : i.cmd, 'filename' : i.filename, 'text' : i.kind})
        else
            let pattern = strpart(i.cmd, 2, strlen(i.cmd) - 4)
            let pattern = escape(pattern, '*[]')
            call add(quickfix, {'pattern' : pattern, 'filename' : i.filename, 'text' : i.kind})
        endif
    endfor
    call setqflist(quickfix)

    only
    copen
    set nowrap

    vsplit
    cfirst
    let g:TagInsight_PreviewWindow = bufnr('%')
    call matchadd('SEARCH_TAGS_NAME', '\<'.a:name.'\>')
    execute 'normal zt'
endfunction
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
let Tlist_Show_One_File = 1            " 不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          " 如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         " 在右侧窗口中显示taglist窗口
let Tlist_File_Fold_Auto_Close=1       " 自动折叠当前非编辑文件的方法列表
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
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
"Plugin 'drmingdrmer/vim-tabbar'          " tab
Plugin 'jlanzarotta/bufexplorer' " buffer
"Plugin 'UltiSnips'
"Plugin 'shawncplus/phpcomplete.vim'
"Plugin 'eikenb/acp'
"Plugin 'othree/vim-autocomplpop'

call vundle#end()            " required
filetype plugin indent on    " required
" }}}

let g:molokai_original = 1
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
let g:DoxygenToolkit_licenseTag="GPL 2.0"

let s:licenseTag = "\<enter>www.firstp2p.com\<enter>"
let s:licenseTag = s:licenseTag . "All right reserved\<enter>"
let s:licenseTag = s:licenseTag . "\<enter>Copyright(C)\<enter>"
let g:DoxygenToolkit_licenseTag = s:licenseTag
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
let g:mapleader = ','
let g:EasyMotion_leader_key = ','
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

"tabular
let g:tabular_loaded = 1

" }}}
