"plugin manage{{{
call plug#begin('~/.vim/plugged')

Plug 'lervag/vimtex'

Plug 'Shougo/neocomplete'
Plug 'SirVer/ultisnips'

Plug '~/.vim/plugged/my-snippets'
Plug '~/.vim/plugged/my-config'

call plug#end()
"}}}

"env{{{
"
"let g:UltiSnipsUsePythonVersion = 3
" let g:tex_fast = "bMpr"
"let g:tex_conceal = "gmd"
let g:tex_conceal = ""

set belloff=all
set encoding=utf-8
set backspace=2
set nocp

set number
"colors
"set term=xterm-256color
"set t_Co=256
"let g:solarized_termcolors=256
syntax enable
set background=dark
colorscheme solarized
set cursorline

"set guifont=DejaVu\ Sans\ Mono\ 12
"set helplang=cn

set hlsearch

"statusline
" set statusline=%f
" set statusline+=%=
" set statusline+=%l
" set statusline+=/
" set statusline+=%L

let g:tex_flavor="latex"
" indent
set autoindent
set expandtab
set tabstop=8
set shiftwidth=2
set softtabstop=2

set autoread
set showmatch
set nocompatible
let g:python_recommended_style=0

set colorcolumn=81

"}}}

"key binding{{{
let mapleader = "\<space>"
"let mapleader = ";"
inoremap jk <esc>
"inoremap <esc> <nop>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>em :vsplit /Users/liujunyi/Documents/Notes/MathPreamble.tex<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
inoremap <leader><leader>jk jk
"inoremap <leader><leader> <space>
inoremap it<leader><tab> \item<space>
nnoremap <silent><c-l> <esc>:call search('\v[([{)\]}$"' . "'" . ']',"e")<cr>
nnoremap <silent><c-h> <esc>:call search('\v[([{)\]}$"' . "'" . ']',"be")<cr>
inoremap <silent><c-l> <esc>:call search('\v[([{)\]}$"' . "'" . ']',"e")<cr>a
inoremap <silent><c-h> <esc>:call search('\v[([{)\]}$"' . "'" . ']',"be")<cr>a
"}}}

"UltiSnips setting{{{
"let g:vimtex_complete_enable = 1
let g:UltiSnipsEnableSnipMate = 1
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
  
let g:UltiSnipsJumpForwardTrigger = "<nop>"
let g:UltiSnipsExpandTrigger = "<nop>"
"let g:UltiSnipsExpandTrigger="<leader>\<tab>"
let g:ulti_expand_or_jump_res = 0 "default value, just set once
function! s:Ulti_ExpandOrJump_and_getRes()
  call UltiSnips#ExpandSnippetOrJump()
  return g:ulti_expand_or_jump_res
endfunction

let g:ulti_jump_backwards_res = 0 "default value, just set once
function! s:Ulti_JumpBackward_and_getRes()
  call UltiSnips#JumpBackwards()
  return g:ulti_jump_backwards_res
endfunction

inoremap <leader><tab> <C-R>=(<SID>Ulti_ExpandOrJump_and_getRes() >0)?"":"\<leader>\<tab>"<CR>
inoremap <leader>` <C-R>=(<SID>Ulti_JumpBackward_and_getRes() >0)?"":"\<leader>`"<CR>
"let g:UltiSnipsJumpBackwardTrigger = "<c-z>"
"}}}

"neocomplete{{{
" Disable AutoComplPop.
"let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
"inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return pumvisible() ? "\<C-y>" : "\<CR>"
" For no inserting <CR> key.
" return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction

" <TAB>: completion.
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ neocomplete#start_manual_complete()
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}
" " <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" " Close popup by <Space>.
" "inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" " AutoComplPop like behavior.
" "let g:neocomplete#enable_auto_select = 1

if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.tex =
      \ g:vimtex#re#neocomplete
"}}}

"vimtex{{{

let g:vimtex_imaps_leader=";"
let g:vimtex_compiler_latexmk = {
        \ 'backend' : 'jobs',
        \ 'background' : 1,
        \ 'build_dir' : '',
        \ 'callback' : 1,
        \ 'continuous' : 0,
        \ 'executable' : 'latexmk',
        \ 'options' : [
        \   '-xelatex',
        \   '-verbose',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}
"let g:vimtex_view_automatic = 1
let g:vimtex_view_method = 'skim'


"}}}
"
