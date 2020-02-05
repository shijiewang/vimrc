" 配置说明{{{
" =============================================
" @author wangshijie<wangshihchieh@sina.com>
" =============================================
" }}}

" 基本配置{{{
syntax on                      " 自动语法高亮
set number                     " 显示行号
set showcmd
set ruler
set mouse=a                    " 鼠标直接定位光标
set shiftwidth=4               " 设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=4              " 使得按退格键时可以一次删掉 4 个空格
set expandtab                  " tab用空格标示
set tabstop=4                  " 设定 tab 长度为 4
set nobackup                   " 覆盖文件时不备份
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
"set autochdir                " 自动切换目录
set fileencodings=utf-8,gbk
set laststatus=2

"autocmd FileType c,cpp,php,go set shiftwidth=4 | set expandtab | %retab!

"function! StripTrailingWhite()
"    silent! %s/\s\+$//
"endfunction

"autocmd BufWritePre,FileWritePre * :call StripTrailingWhite()

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
map <silent> eq :qa!<CR>
map <silent> ev :vsplit<CR>
map <silent> eg :!/usr/bin/git log --stat %<CR>
map <silent> eG :echo system('/usr/bin/git blame '.expand('%').' -p -L '.line('.').','.line('.'))<CR>
map ee <C-]>             " 跳转到定义
map E <C-t>              " 返回查找
map <silent> ew :w<CR>   " 定义快捷键保存当前窗口内容
nnoremap nw <C-W><C-W>   " 依次遍历子窗口
nnoremap <C-l> <C-W>l    " 跳转至右方的窗口
nnoremap <C-k> <C-W>k    " 跳转至上方的子窗口
nnoremap <C-j> <C-W>j    " 跳转至下方的子窗口
nnoremap <C-h> <C-W>h    " 跳转至左方的窗口
set pastetoggle=<F8>     " 粘贴模式

inoremap jj <esc>
nmap <leader><leader> :
nmap <leader>gb :!/usr/bin/git blame %<CR>
nmap <leader>gd :!/usr/bin/git diff %<CR>
command! W :w !sudo tee %

function! Zoom ()
    " check if is the zoomed state (tabnumber > 1 && window == 1)
    if tabpagenr('$') > 1 && tabpagewinnr(tabpagenr(), '$') == 1
        let l:cur_winview = winsaveview()
        let l:cur_bufname = bufname('')
        tabclose

        " restore the view
        if l:cur_bufname == bufname('')
            call winrestview(cur_winview)
        endif
    else
        tab split
    endif
endfunction

nmap el :call Zoom()<CR>

"}}}

" 配色方案{{{

" }}}

" 状态栏以及配色方案{{{
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
nnoremap bl :ls<CR>
autocmd BufEnter *.c call SourceTagsVim()

"}}}

"nmap <leader>fw :se fileformat=dos<CR>
"nmap <leader>fu :se fileformat=unix<CR>

filetype plugin on | syntax on | color torte
let g:go_version_warning = 0

" 行尾字符、状态栏、go特殊格式
set list listchars=tab:>-,trail:.
set statusline=%F\ %1*%m%*\ %r\ %{&paste?'[PASTE]':''}%=\ (%c,\ %l,\ %p%%)\ %1*\ %L\ %*\ %{toupper(&fenc!=''?&fenc:&enc)}\ [0x%B]
autocmd BufEnter *.go setlocal noexpandtab tabstop=8 shiftwidth=8 nolist

nnoremap <leader>f :LeaderfFile<cr>
nnoremap <leader>r :LeaderfMru<cr>
nnoremap <leader>s :Leaderf rg --cword<cr>
noremap <F2> :LeaderfFunction!<cr>
let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git','.hg','.vscode','.wine','.deepinwine','.oh-my-zsh'],
            \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
            \}

" 按Esc键退出函数列表
let g:Lf_NormalMap = {
   	\ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
   	\ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>']],
   	\ "Mru":    [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
   	\ "Tag":    [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
   	\ "Function":    [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
   	\ "Colorscheme":    [["<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']],
   	\ }
 let g:Lf_UseCache = 0

" ack
if executable('rg')
    let g:ackprg = 'rg --vimgrep'
endif
let g:ackhighlight = 1
let g:ack_autoclose = 1

"------------GO Lang Customizations
let g:go_fmt_command = 'goimports'

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
autocmd FileType go nmap <leader>t <Plug>(go-test)
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)
colorscheme desert

" 插件管理 {{{
" 安装 vim-plug
command! InstallVimPlug :!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')
"Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'fatih/vim-go'
Plug 'airblade/vim-gitgutter'           " git插件
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-multiple-cursors'     " 多行编辑插件
Plug 'Lokaltog/vim-easymotion'          " 快速移动插件
Plug 'plasticboy/vim-markdown'          " markdown
Plug 'tpope/vim-surround'               " 闭合处理
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bronson/vim-trailing-whitespace' " 显示空格
Plug 'tpope/vim-fugitive'              " for git
Plug 'ludovicchabant/vim-gutentags'
Plug 'mhinz/vim-signify'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/LeaderF'
Plug 'tpope/vim-unimpaired'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Shougo/deoplete.nvim', { 'do' : 'vim +UpdateRemotePlugins +qall' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()
let g:Lf_ReverseOrder = 1
map <silent> em :LeaderfMru<CR>
map <silent> ef :LeaderfFunction<CR>

" }}}

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
" easymotion=快速移动配置 {{{
let g:EasyMotion_leader_key = 'f'
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
" }}}

