" ========================================= "
" vimrc mappings, plugins and configuration "
" author: Julie Kramer                      "
" github: https://github.com/thejuliekramer "
" ========================================= "
"
"
" ============================ "
" Vundle related configuration "
" ============================ "

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"alternatively, pass a path where Vundle should install plugins
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

"All Plugins must be added before the following line
call vundle#end()         " required
filetype plugin indent on " required

" ============================ "
" Vim related configuration    "
" ============================ "

syntax on                                                " syntax highlighting
set number                                               " show line numbers
set laststatus=2                                         " always display the status line
set si                                                   " smart indent
let g:netrw_liststyle=3                                  " sets the list style for Netrw
set noshowmode                                           " remove mode from status line when using vim airline
set expandtab                                            " tabs are spaces
set tabstop=2                                            " number of visual spaces per TAB
set shiftwidth=2                                         " number of space characters inserted for indentation
set timeoutlen=1000                                      " used for mapping delays
set ttimeoutlen=0                                        " used for keycode delays
set incsearch                                            " searches characters as they are entered
set hlsearch                                             " highlight matches
let g:solarized_termcolors = 256
                                                         " set background=dark
colorscheme molokai
let g:molokai_original = 1
set cursorline
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro' " show line numbers in Netrw
set noswapfile                                           " Disable swapfile from creating
set wildmenu                                             " visual autocomplete for command menu
set ignorecase                                           " ignore case sensitivity when searching
set list listchars=tab:»·,trail:·                        " Display extra whitespace
set backspace=2                                          " make backspace work like most other apps


autocmd BufNewFile,BufRead \*.{md,mdwn,mkd,mkdn,mark\*} set filetype=markdown

" ============================ "
" Mappings                     "
" ============================ "

" set leader key
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
" Open VIMRC file with <SPACE> vm
nmap <leader>vm :tabedit $MYVIMRC<CR>
" Go to related controller with leader c
nnoremap <leader>c :Econtroller<CR>
" Copy/paste without going to visual mode
nnoremap yp vyp<CR>
" Go to related model with leader m
nnoremap <leader>m :Emodel<CR>
" jk is escape
inoremap jk <esc>
" Easy access to the start of the line
nmap 0 ^
" Breakout into a new tab
nnoremap <Leader>bt <C-w>T
" Drop in Pry to debug. Leader bp
nmap <leader>bp obinding.pry<esc>^
" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>
" Source (reload) your vimrc. Type space, s, o in sequence to trigger
nmap <leader>so :source $MYVIMRC<cr>
" Open a vim/tmux runner window
nnoremap <leader>osr :VtrOpenRunner {'orientation': 'h', 'percentage': 50}<cr>
" Vim tmux runner attach to pane
nnoremap <leader>va :VtrAttachToPane<cr>
" Send lines to runner - normal and visual mode
nmap <C-f> :VtrSendLineToRunner<cr>
vmap <C-f> <Esc>:VtrSendSelectedToRunner<cr>
" Send command to runner
nnoremap <leader>sc :VtrSendCommandToRunner<cr>
" Focus VTR runner
nnoremap <leader>fr :VtrFocusRunner<cr>

" ============================ "
" Misc. configuration          "
" ============================ "

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

runtime macros/matchit.vim " Jump between method/class openings and closing tags with %

source ~/.vim/rspec " RSpec shortcut commands
