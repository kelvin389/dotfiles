" map jk to escape while in insert mode
inoremap jk <Esc>
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

" color scheme
colorscheme peachpuff

" comment color to green
highlight Comment ctermfg=green

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
