" map jk and kj to escape while in insert mode
inoremap jk <Esc>
inoremap kj <Esc>
" map ctrl-j and ctrl-k to scroll 1 line while in normal mode
nnoremap <c-j> <c-e>
nnoremap <c-k> <c-y>
"map shift-j and shift-k to scroll half a screen while in normal mode
nnoremap <s-j> <c-d>
nnoremap <s-k> <c-u>

" clear search when hitting return (enter)
nnoremap <CR> :noh<CR><CR>

" 0 to go to first non white space rather than
" beginning of line
noremap 0 ^

" syntax highlighting
syntax on

" merge vim register with OS clipboard
set clipboard=unnamed

" Influences the working of <BS>, <Del>, CTRL-W and CTRL-U in Insert
" mode.  This is a list of items, separated by commas.  Each item allows
" a way to backspace over something:
set backspace=2

" gui vim font
if has("gui_running")
    set guifont=Consolas:h12:cANSI
endif

" custom color scheme for gui
try
    colorscheme seoul256 
    let g:seoul256_background=234
    colo seoul256
catch
    colorscheme peachpuff
endtry

" set tab size to 4 spaces
set tabstop=4
set shiftwidth=4 

" spaces instead of tabs
set expandtab

" auto indent
set ai

" highlight search
set hlsearch

" ignore case when searching
set ignorecase

" search as input comes in
set incsearch

" show ruler in bottom right
set ruler

" set scroll off
set so=5

" disable error sounds
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

" hybrid numbers in buffer mode
" (absolute on current line, relative otherwise),
" absolute in insert mode
:set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END
