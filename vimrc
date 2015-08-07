set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'kien/ctrlp.vim'
Plugin 'ervandew/supertab'
Plugin 'tomtom/tlib_vim'
Plugin 'bling/vim-airline'
Plugin 'marcweber/vim-addon-mw-utils'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-rails'
Plugin 'thoughtbot/vim-rspec'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'godlygeek/tabular'
Plugin 'mileszs/ack.vim'

" All of your Plugins must be added before the following line
call vundle#end()         " required
filetype plugin indent on " required

syntax on                 " syntax highlighting
set number                " show line numbers
set laststatus=2
set si                    " smart indent
let g:netrw_liststyle=3   " sets the list style for Netrw
set noshowmode            " remove mode from status line when using vim airline
set expandtab             " tabs are spaces
set tabstop=2             " number of visual spaces per TAB
set shiftwidth=2          " number of space characters inserted for indentation
set timeoutlen=1000       " used for mapping delays
set ttimeoutlen=0         " used for keycode delays
set incsearch             " searches characters as they are entered
set hlsearch              " highlight matches
let g:solarized_termcolors = 256
" set background=dark
colorscheme molokai
let g:molokai_original = 1
set cursorline
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro' "show line numbers in Netrw
set noswapfile " Disable swapfile from creating
set wildmenu " visual autocomplete for command menu
" let g:airline_theme='powerlineish'
" For Preview
autocmd BufNewFile,BufRead \*.{md,mdwn,mkd,mkdn,mark\*} set filetype=markdown

" Mappings
let mapleader = " "
" Git Blame mapping
vmap <Leader>b :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>
nnoremap <Leader>w :w<CR>
" Open a new file
nnoremap <Leader>o :CtrlP<CR>
" Suspend Vim and Reopen
nnoremap <Leader>z <C-Z><CR>
" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>
" Switch panes
nnoremap <Leader>ss <C-W>w
" Open related file in split pane with <SPACE> rv
nmap <leader>rv :RV<CR>
" " Open related file in full pane with <SPACE> rr
nmap <leader>rr :R<CR>
" Clear trailing whitespace
nnoremap <Leader>rt :%s/\s\+$//e<CR>

if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

runtime macros/matchit.vim " Jump between method/class openings and closing tags with %

source ~/.vim/rspec " RSpec shortcut commands
