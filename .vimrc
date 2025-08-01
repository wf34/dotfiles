" enable jumping between buffers without saving them every time
set hidden
set autowrite
set noshowmode

" primary *and* clipboard
set clipboard=unnamed,unnamedplus

syntax on
filetype plugin on
filetype indent off

" Automatically indent when adding a curly bracket, etc.
set nosmartindent
set autoindent
set nocindent

" Tabs
set shiftwidth=2
set softtabstop=0
set tabstop=2
set smarttab
set expandtab
" Minimal number of screen lines to keep above and below the cursor.
set scrolloff=999
" Use UTF-8.
set encoding=utf-8
" Search, higlighting search results and highlighting matched brackets
set showmatch
set hlsearch
set incsearch

set number
set ruler
set nobackup
set noswapfile

"line to indicate line length limit
set colorcolumn=100

" Set Leader
let mapleader = ","

" kill bad habit
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

" split switching
nnoremap <A-j> : <C-W><J>
nnoremap <A-k> : <C-W><K>
nnoremap <A-l> : <C-W><L>
nnoremap <A-h> : <C-W><H>

" save
nnoremap <C-S> : w <CR>

" navigation
nnoremap <Leader>l :ls<CR>:b<Space>

set wildignore+=*/node_modules

" auto-commenting switched off
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" buffer navigation
nnoremap <C-l> : bn<CR>
nnoremap <C-h> : bp<CR>

" search cancel
nnoremap <Leader>/ : noh<CR>

" clipboard paste
nnoremap <silent> <S-Insert> "+p
" clipboard copy
vnoremap <silent> <C-Insert> "+y

call plug#begin('~/.vim/plugged')
    Plug 'Valloric/YouCompleteMe', { 'on' : [] }
    Plug 'itchyny/lightline.vim'
    Plug 'rking/ag.vim'
    Plug 'jeffkreeftmeijer/vim-numbertoggle'
    Plug 'kopischke/vim-fetch'
    Plug 'ConradIrwin/vim-bracketed-paste'
    Plug 'lervag/vimtex', { 'for' : ['tex', 'bib'] }
    Plug 'lervag/wiki.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'mtth/scratch.vim'
call plug#end()

augroup load_ycm
  autocmd!
  autocmd InsertEnter * call plug#load('YouCompleteMe') | autocmd! load_ycm
augroup END

"## color
set background=dark
autocmd VimEnter * highlight Comment ctermbg=Black
autocmd VimEnter * highlight Normal ctermbg=Black
autocmd VimEnter * highlight NonText ctermbg=Black

if has("gui_running")
  set guioptions-=M
  set guioptions-=T
  set guioptions-=r
  set guioptions-=L
  set guifont=Iosevka\ Term\ Light\ 16
  " Try it with no mouse
  set mousehide
  " in case rightclick needed
  " set mousemodel = popup
endif

"-- YouCompleteMe
    " let g:ycm_global_ycm_extra_conf =
    "     \'~/.vim/bundle/YouCompleteMe/.ycm_conf.py'

    " disable preview window appearence
    set completeopt -=preview
    let g:ycm_add_preview_to_completeopt = 0
    " switch ycm off/on [next line rem - it's on]
    " let g:loaded_youcompleteme = 1
    let g:ycm_python_binary_path = 'python3'
    let g:ycm_confirm_extra_conf = 0
    let g:ycm_show_diagnostics_ui = 0

"-- Vim-LaTeX
    let g:vimtex_latexmk_continuous = 0
    let g:vimtex_fold_enabled = 0
    let g:vimtex_latexmk_build_dir = 'build'
    let g:vimtex_imaps_enabled = 0
    let g:vimtex_indent_enabled = 0
    command Co VimtexCompile
    command Rei VimtexReinit

"-- lightline
    set laststatus=2
    let g:lightline = { 'colorscheme': 'solarized' }

"-- ag.vim (silver searcher)
    let g:ag_working_path_mode="r"
    nnoremap <Leader>a : Ag!<SPACE>
    nnoremap <Leader><C-a> : Ag!<CR>

 "-- vim-numbertoggle
    nnoremap <Leader><C-n> : set relativenumber!<CR>

"-- fzf.vim
    nnoremap <leader>t :Files<CR>
    nnoremap <leader><C-t> :Buffers<CR>

"-- wiki.vim
  let g:wiki_root = '~/projects/wiki'
  nnoremap <Leader><S-w> : WikiPages<CR>
  nnoremap <Leader>j : WikiJournal<CR>

"-- scratch.vim
  nnoremap <Leader><S-s> : Scratch<CR>
