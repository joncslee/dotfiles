" pathogen!
call pathogen#infect()
colorscheme desert

" Basic settings {{{
let mapleader = ","
let maplocalleader = "\\"

set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set number
set directory=~/.vim/tmp//,/tmp

syntax on
filetype plugin indent on

" }}}

" Mappings {{{

nnoremap <leader>d :NERDTreeToggle<cr>

noremap <C-H> <C-W>h
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-L> <C-W>l

" quickly open/source vimrc file
nnoremap <leader>ev :sp $MYVIMRC<cr>
nnoremap <leader>sv :so $MYVIMRC<cr>

" wrap current word in quotes
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

" use jk to exit insert mode
inoremap jk <esc>
inoremap <esc> <nop>

" indent and outdent in vis mode leaves you in vis mode
vnoremap > >gv
vnoremap < <gv

" operator-pending for parens and quotations
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap in" :<c-u>normal! f"vi"<cr>
onoremap il" :<c-u>normal! F"vi"<cr>

" open previous buffer in vsplit
nnoremap <leader>sp :execute "vsplit " . bufname("#")<cr>

" error trailing whitespace
nnoremap <leader>w :match Error /\v\s+$/<cr>
nnoremap <leader>W :match Normal /\v\s+$/<cr>

" always very-magic search
nnoremap / /\v

" quickfix toggle
nnoremap <leader>q :call <SID>QuickfixToggle()<cr>
let g:quickfix_is_open = 0
function! s:QuickfixToggle()
  if g:quickfix_is_open
    cclose
    let g:quickfix_is_open = 0
    execute g:quickfix_return_to_window . "wincmd w"
  else
    let g:quickfix_return_to_window = winnr()
    copen
    let g:quickfix_is_open = 1
  endif
endfunction

" yank leaves you at the end of selection
vnoremap y y'>

" }}}

" Filetype-specific settings {{{

" fold settings for certain filetypes
augroup folding
  autocmd!
  autocmd FileType ruby setlocal foldmethod=manual
  autocmd FileType css setlocal foldmethod=indent
  autocmd FileType vim setlocal foldmethod=marker
augroup END

" filetype-specific comments
augroup comments
  autocmd!
  autocmd FileType ruby nnoremap <buffer> <localleader>c I# 
  autocmd FileType javascript nnoremap <buffer> <localleader>c I// 
augroup END

" }}}

" Status line settings {{{

" status line format
set statusline=%f         " Path to the file
set statusline+=%=        " Switch to the right side
set statusline+=%l        " Current line
set statusline+=/         " Separator
set statusline+=%L        " Total lines

" }}}
