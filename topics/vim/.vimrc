filetype off
syntax on

let base16colorspace=256
let g:solarized_termcolors=256

if filereadable(expand("~/.vimrc_background"))
    source ~/.vimrc_background
endif

let g:solarized_termtrans=1
let g:mapleader = ","
let mapleader = ","
let g:ycm_confirm_extra_conf = 0
let g:clang_format#command="clang-format-3.6"
let g:clang_format#detect_style_file=1
let g:clang_format#auto_formatexpr=1
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
set textwidth=0

set ai
set autoread
set background=dark
set backspace=indent,eol,start
set cmdheight=1
set colorcolumn=80,100,120
set cursorline
set encoding=utf-8 nobomb
set expandtab
set exrc
set ffs=unix,mac,dos
set ff=unix
set gdefault
set history=700
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set magic
set mat=2
set modeline
set nobackup
set nocompatible
set noerrorbells
set nohidden
set noswapfile
set novisualbell
set nowb
set number
set pastetoggle=<leader>p
set ruler
set secure
set shell=/bin/bash
set shiftwidth=4
set shortmess=atI
set showcmd
set showmatch
set showmode
set si
set smartcase
set splitright
set splitbelow
set softtabstop=4
set t_Co=256
set t_vb=
set tabpagemax=50
set tabstop=4
set title
set tm=500
set ttimeout
set ttyfast
set whichwrap+=<,>,h,l
set wildignore=*.o,*~,*.pyc,*/build/*,*/bin/*
set wildmenu

if $TMUX == ''
    set clipboard+=unnamed
endif

hi TabLine ctermfg=10

try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

nnoremap <C-J> <C-A-Up>
nnoremap <C-K> <C-A-Down>
nnoremap <C-H> <C-A-Left>
nnoremap <C-L> <C-A-Right>
nmap <F1> :if expand('%:e')=='hh'<CR>e %:r.cc<CR>else<CR>e %:r.hh<CR>endif<CR><CR>
imap jj <Esc>
imap qq <Esc>
imap ;; <Esc>

noremap <F3> :Autoformat<CR>
noremap <leader>a :Autoformat<CR>
noreabbrev cav cd ~/src/av
noreabbrev ccd cd %:p:h
noreabbrev ccdd cd %:p:h <bar> cd ..
noreabbrev setgopath let $GOPATH='.'

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle 'edkolev/tmuxline.vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'VundleVim/Vundle.vim'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'chriskempson/base16-vim'
Plugin 'fatih/vim-go'
Plugin 'nsf/gocode', {'rtp': 'vim/'}
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'stephpy/vim-yaml'
Plugin 'tpope/vim-abolish'
Plugin 'uber/prototool', {'rtp': 'vim/prototool'}
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'w0rp/ale'

colorscheme base16-ocean

let g:flake8_show_quickfix=1
let g:flake8_show_in_gutter=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline_theme='base16'
let g:NERDTreeMapOpenInTab = ''
let g:phabrowse_domains = ['https://code.int.uberatc.com']
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
let g:go_def_mode = 'godef'

let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '>',
    \ 'right' : '',
    \ 'right_alt' : '<',
    \ 'space' : ' '}

let g:ale_linters = {
    \ 'go': ['golint'],
    \ 'proto': ['prototool'],
    \ }
let g:ale_lint_on_text_changed = 'never'
noremap <silent> <leader>f :call PrototoolFormatToggle()<CR>

" let g:ale_lint_on_enter = 0
let g:airline#extensions#ale#enabled = 1
nnoremap <silent> <C-n> :ALEPrevious<CR>
nnoremap <silent> <C-m> :ALENext<CR>

if has("autocmd")
    filetype on
    filetype plugin on
    filetype indent on

    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    autocmd BufNewFile,BufRead *.json setfiletype json setlocal syntax=javascript ts=2 sts=2
    autocmd BufNewFile,BufRead *.md setfiletype markdown
    autocmd BufNewFile,BufRead *.yml,*.sls setfiletype yaml
    autocmd BufNewFile,BufRead *.hidl setfiletype cpp
    autocmd BufNewFile,BufRead *.go setlocal syntax=go
    autocmd BufNewFile,BufRead Vagrantfile setfiletype ruby
    autocmd BufNewFile,BufRead BUILD.* setfiletype conf setlocal syntax=conf
    autocmd BufNewFile,BufRead *.bzl setfiletype py setlocal syntax=python
    autocmd BufNewFile,BufRead *.py set ts=4 sts=4 sw=4 expandtab nosmartindent ff=unix
    autocmd BufNewFile,BufRead,BufEnter *.cc,*.hh ALEDisable
    autocmd BufWritePost *.py call Flake8()
    " autocmd BufNewFile,BufRead *.yaml,*.yml so ~/.vim/bundle/vim-yaml/after/yaml.vim
    " autocmd Filetype c,cpp,hidl set comments^=:///

    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab smartindent
    autocmd FileType sh setlocal ts=2 sts=2 sw=2 expandtab smartindent

    " autocmd BufWritePre *.go call go#lint#Run()
endif

function! NumberToggle()
    if(&rnu == 1)
        set nu
        set nornu
    else
        set nonu
        set rnu
    endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

"if has("autocmd")
"    filetype on
"    filetype plugin on
"    filetype indent on
"
"    " autocmd FileType javascript setlocal ts=2 sts=2 sw=2
"    " autocmd FileType json setlocal ts=2 sts=2 sw=2
"    " autocmd FileType ruby setlocal ts=2 sts=2 sw=2
"    " autocmd FileType yaml setlocal ts=2 sts=2 sw=2
"
"    autocmd BufReadPost *
"        \ if line("'\"") > 0 && line("'\"") <= line("$") |
"        \   exe "normal! g`\"" |
"        \ endif
"endif

highlight LineNr ctermbg=0
highlight colorcolumn ctermbg=0

call vundle#end()
