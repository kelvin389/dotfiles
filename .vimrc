""""""""""""""""""""""""""""
" Plugin prerequisites
""""""""""""""""""""""""""""
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

"""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""
call plug#begin("$HOME/.vim/plugged")

Plug 'junegunn/seoul256.vim'
Plug 'itchyny/lightline.vim'

call plug#end()


"""""""""""""""""""""""""""""
" Custom Commands
"""""""""""""""""""""""""""""
command Q execute "q"

" yank all to clipboard
command Y execute "%y+"


"""""""""""""""""""""""""""""
" Remaps
"""""""""""""""""""""""""""""
" clear space remaps
nnoremap <space> <nop>
" set leader to space
let mapleader=" "

" map jk to exit insert mode
inoremap jk <Esc>

" <space><space> to search
nnoremap <leader><leader> /
" clear search when hitting return (enter) in normal mode
nnoremap <silent> <cr> :noh<cr>

" <space>p to paste from os clipboard
noremap <leader>p "+p 
noremap <leader>P "+P
" <space>y to yank to os clipboard
noremap <leader>y "+y
noremap <leader>Y "+Y

" <space>ay to yank to 'a' register
noremap <leader>ay "ay
" <space>ap to paste to 'a' register
noremap <leader>ap "ap

" H to go to first non whitespace character
noremap H ^
" L to go to last non whitespace character
noremap L g_

" map ctrl+backspace to delete the previous word
" non-terminal
inoremap <c-bs> <c-w>
" terminal
inoremap <c-h> <c-w>

" unmap Q
nnoremap Q <nop>

"""""""""""""""""""""""""""""
" Visuals
"""""""""""""""""""""""""""""
" statusline
set laststatus=2
let g:lightline = {
   \ 'colorscheme': 'seoul256',
   \ 'active': {
   \     'left': [ [ 'mode', 'paste' ],
   \               [ 'filename' ] ],
   \ },
   \ 'component_function': {
   \     'filename': 'LightlineFilename',
   \ },
   \ }

" customize filename to include readonly and modified symbols
function! LightlineFilename()
    let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
    let readonly = &readonly ? ' [RO]' : ''
    let modified = &modified ? ' [+]' : ''
    return filename . readonly . modified
endfunction

" disable mode text
set noshowmode

" show search results in bottom right
set shortmess-=S

" always show message when line is changed (yank, n fewer lines, etc)
" helps to verify if yank to clipboard worked
set report=0

" theme
let g:seoul256_background=233
color seoul256
set termguicolors

" syntax highlighting
syntax on

" change terminal cursor based on mode
let &t_SI.="\e[5 q" " insert mode = blinking line
let &t_SR.="\e[4 q" " replace mode = underscore
let &t_EI.="\e[1 q" " normal mode = blinking block

" commands for gui vim
if has("gui_running")
    " change font to 12pt consolas
    set guifont=Consolas:h12:cANSI

    " set default window size
    set lines=28
    set columns=98
endif


"""""""""""""""""""""""""""""
" Functionality Settings
"""""""""""""""""""""""""""""
" put all swp files in a consistent directory
set directory=$HOME/.vim/swap//  

" wait 350 ms instead of 1000 in a key combo
set timeoutlen=350

" allow backspacing over indents, start of lines, and end of lines
set backspace=2

" set tab size to 4 spaces
set tabstop=4
" backspacing an indented line will erase 4 spaces
set softtabstop=4 
set shiftwidth=4 

" don't allow vim to wrap line in the middle of a word
set linebreak

" tabs turn to spaces
set expandtab

" auto indent
set ai

" highlight search
set hlsearch

" ignore case if search is all lowercase
set ignorecase
" case sensitive if search contains capital
set smartcase

" continually search as query is typed
set incsearch

" don't allow cursor to be n lines away from top/bottom of window
set so=5

" disable error sounds
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

" hybrid numbers in buffer mode (absolute on current line, relative otherwise),
" absolute in insert mode
:set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END
