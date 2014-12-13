set nocompatible " Make Vim more useful
filetype off " required by Vundle.vim
set runtimepath+=~/.dotfiles/vim/bundle/Vundle.vim

call neobundle#begin(expand('~/.dotfiles/vim/bundle/'))
	NeoBundleFetch 'Shougo/neobundle.vim'
	NeoBundle 'tpope/vim-fugitive
	NeoBundle 'scrooloose/nerdtree'
	NeoBundle 'tpope/vim-surround'
	NeoBundle 'scrooloose/syntastic'
	if has('lua')
			NeoBundle 'Shougo/neocomplcache.vim'		
	endif
call neobundle#end()
NeoBundleCheck
filetype plugin indent on " Enhance command-line completion
set wildmenu " Allow cursor keys in insert mode
set esckeys " Allow backspace in insert mode
set backspace=indent,eol,start " Optimize for fast terminal connections
set ttyfast " Add the g flag to search/replace by default
set gdefault " Use UTF-8 without BOM
set encoding=utf-8 nobomb " Change mapleader
let mapleader=","
" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
syntax on " Enable syntax highlighting
colorscheme solarized
" Make tabs as wide as two spaces
set tabstop=4
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

