" clear space remaps
nnoremap <space> <nop>
" set leader to space
let mapleader=" "

" <space> qq to quickly save (if there were changes) and exit
noremap <leader>qq :x<cr>
" <space> w to quickly save (if there were changes)
noremap <leader>w :update<cr>

" make q do nothing
noremap q <nop>
" Q to record a macro
noremap Q q

" map jk to exit insert mode
inoremap jk <Esc>
"map shift-j and shift-k to scroll half a screen
noremap <s-j> <c-d>
noremap <s-k> <c-u>

" <space><space> to search
nnoremap <leader><leader> /
" clear search when hitting return (enter) in normal mode
nnoremap <cr> :noh<cr>

" <space>p to paste from os clipboard
noremap <leader>p "+p
" <space>y to yank to os clipboard
noremap <leader>y "+y

" H to go to first non whitespace character
noremap H ^
" L to go to last non whitespace character
noremap L g_

" map ctrl+backspace to delete the previous word
" doesnt work on default mac catalina termianl (zsh)
inoremap <c-bs> <c-w>

" default color scheme (overwritten at bottom of script if using gui)
colorscheme peachpuff

" syntax highlighting
syntax on
highlight Comment ctermfg=Green

" change terminal cursor based on mode
let &t_SI.="\e[5 q" " insert mode = blinking line
let &t_SR.="\e[4 q" " replace mode = underscore
let &t_EI.="\e[1 q" " normal mode = blinking block

" allow backspacing over indents, start of lines, and end of lines
" same as 'set backspace=indent,eol,start'
set backspace=2

" set tab size to 4 spaces
set tabstop=4
set softtabstop=4 " backspacing an indented line will erase 4 spaces
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
" case sensitive if search contains capaital
set smartcase

" continually search as query is typed
set incsearch

" show ruler in bottom right
set ruler

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

" commands for gui vim
if has("gui_running")

    " change font to 12pt consolas
    set guifont=Consolas:h12:cANSI

    " try overwriting color scheme
    try
        colorscheme seoul256 
        let g:seoul256_background=234
        colo seoul256
    endtry

    " set window size default
    set lines=28
    set columns=98
endif
