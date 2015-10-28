if has('vim_starting')
	if &compatible
		set nocompatible
	endif
	set runtimepath+=~/.local/share/neobundle/
endif

call neobundle#begin(expand('~/.local/share/vim-plugins/'))
	NeoBundleFetch 'Shougo/neobundle.vim'
	NeoBundle 'tpope/vim-fugitive'
	NeoBundle 'scrooloose/nerdtree'
	NeoBundle 'tpope/vim-surround'
	NeoBundle 'scrooloose/syntastic'
	NeoBundle 'bling/vim-airline'
	NeoBundle 'Raimondi/delimitMate'
	if has('lua')
		NeoBundle 'Shougo/neocomplcache.vim'		
	endif
call neobundle#end()
NeoBundleCheck
filetype plugin indent on " Enhance command-line completion

syntax enable " Enable syntax highlighting
let g:neocomplcache_temporary_dir = '~/.cache/vim/tmp/'
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

set wildmenu
set autoread  " automatically read changed file
set esckeys  " Allow cursor keys in insert mode
set backspace=indent,eol,start  " Allow backspace in insert mode
set ttyfast  " Optimize for fast terminal connections
set gdefault " Add the g flag to search/replace by default
set encoding=utf-8 nobomb " Use UTF-8 without BOM
set modeline " Respect modeline in files
set modelines=4
set mouse=a  " enable the mouse in all modes
set exrc " Enable per-directory .vimrc files and disable unsafe commands in them
set secure " prevent local vimrc from doing nasty things
set number " Enable line numbers
set tabstop=4 " Make tabs as wide as four spaces
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_ " Show “invisible” characters
set list
set hlsearch " Highlight searches
set ignorecase " Ignore case of searches
set incsearch " Highlight dynamically as pattern is typed
set laststatus=2 " Always show status line
set noerrorbells " Disable error bells
set nostartofline " Don’t reset cursor to start of line when moving around.
set ruler " Show the cursor position
set shortmess=atI " Don’t show the intro message when starting Vim
set showmode " Show the current mode
set title " Show the filename in the window titlebar
set showcmd " Show the (partial) command as it’s being typed
set scrolloff=3 " Start scrolling three lines before the horizontal window border
let mapleader="," " Change mapleader

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
