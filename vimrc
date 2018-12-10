if &compatible
  set nocompatible
endif

" Add the dein installation directory into runtimepath
set runtimepath+=~/.local/share/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/vim/dein')
  call dein#begin('~/.cache/vim/dein')

  call dein#add('~/.local/share/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('arcticicestudio/nord-vim')
  call dein#add('scrooloose/nerdtree')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  call dein#end()
  call dein#save_state()
endif

let g:deoplete#enable_at_startup = 1
filetype plugin indent on " Enhance command-line completion
syntax enable " Enable syntax highlighting

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

set viminfo+=n~/.cache/vim/viminfo
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
set undofile " tell it to use an undo file
set undodir=~/.cache/vim/undo/ " set a directory to store the undo history
set directory=~/.cache/vim/swap/
set backupdir=~/.cache/vim/backup/

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
