    " for painless copy-paste
    set pastetoggle=<F10>

    " Enable syntax highlighting.
	"syntax on
	
	" Automatically indent when adding a curly bracket, etc.
    set smartindent
        
	" Tabs should be converted to a group of 4 spaces.
	" This is the official Python convention
    " (http://www.python.org/dev/peps/pep-0008/)
	" I didn't find a good reason to not use it everywhere.
	set shiftwidth=4
    set tabstop=4
    set smarttab
    set expandtab
	
    " Minimal number of screen lines to keep above and below the cursor.
	set scrolloff=999
	
	" Use UTF-8.
	set encoding=utf-8
        
	" Set color scheme that I like.
	if has("gui_running")
	    colorscheme desert
	else
	    colorscheme darkblue
    endif

	" Search, higlighting search results and highlighting matched brackets
    set showmatch
    set hlsearch
    set incsearch
	
	" Status line
	set laststatus=2
	set statusline=
    set statusline+=%-3.3n\                      " buffer number
	set statusline+=%f\                          " filename
	set statusline+=%h%m%r%w                     " status flags
	set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
	set statusline+=%=                           " right align remainder
	set statusline+=0x%-8B                       " character value
    set statusline+=%-14(%l,%c%V%)               " line, character
	set statusline+=%<%P                         " file position
        
	" Show line number, cursor position.
	set ruler
	" Obvious requirement
	set number
	"No reserve filecopies ~filename.txt 
	set nobackup
    " Better look
    set antialias
    " Current line highlighted
    if has("gui_running")
        set cursorline
    else
        set cursorline
        hi CursorLine cterm=NONE ctermbg=darkgrey
    endif

    " Print special symbols
    " set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
    " set list
    " Signal the too long line
    autocmd FileType text setlocal textwidth=80
    au FileType c,cc,cpp,h,hpp,py,sh au BufWinEnter * let w:m1=matchadd('ErrorMsg', '\%>80v.\+', -1)

    " NerdTREE plugin configs
    autocmd VimEnter * NERDTree | wincmd p
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType")
    \ && b:NERDTreeType == "primary") | q | endif
    " hide/show nerdtree on NE
    :command NE NERDTreeToggle


" Lines added by the Vim-R-plugin command :RpluginConfig (2014-мар-19 00:46):
set nocompatible
filetype plugin on
filetype indent on

" Required by Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'

"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


"no junkfiles
set noswapfile
