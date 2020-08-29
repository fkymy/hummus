" Skip initialization for vim-tiny or vim-small.
if 0 | endif

" Be iMproved
if &compatible
  set nocompatible
endif

filetype off

" Required:
filetype plugin indent on

""""""""""""""""""""""""""""""
" Temporary Customization
""""""""""""""""""""""""""""""

"disable annoying beeps
set noeb vb t_vb=

"allow mouse usage in terminal
set mouse=a
"use OS clipboard
set clipboard+=unnamed
"system clipboard when yanked
set clipboard=unnamed
"Ctrl+k to copy what's on clipboard
imap <C-p>  <ESC>"*pa

"show command in status line
set showcmd
"show unseen words
set list
"display where tabs and lines go
set listchars=tab:>\ ,extends:<

"incremental search
set incsearch
"highlight search
set hlsearch
"ignore case
set ignorecase

"show filepath on window titlebar
set title
"display line number
set number
"locate cursor
set ruler

set laststatus=2

"for html
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

""""""""""""""""""""""""""""""
" Colors
""""""""""""""""""""""""""""""
syntax on

""""""""""""""""""""""""""""""
" Indents
""""""""""""""""""""""""""""""
"default tab to 2 spaces
set tabstop=4
"default indent width
set shiftwidth=4
"tabs become multiple spaces
"set expandtab
"continue previous tab when going to next line
set autoindent
"adjust indents when going to next line
"set smartindent
set noexpandtab

"credits: https://github.com/yuroyoro/dotfiles/blob/master/.vimrc.indent
if has("autocmd")
  "ファイルタイプの検索を有効にする
  filetype plugin on
  "そのファイルタイプにあわせたインデントを利用する
  filetype indent on
  " これらのftではインデントを無効に
  "autocmd FileType php filetype indent off

  autocmd FileType c          setlocal sw=4
  autocmd FileType css        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType diff       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType java       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
  autocmd FileType jsx        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType perl       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType php        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType haml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sh         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType sql        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType xhtml      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType xml        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType zsh        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scala      setlocal sw=2 sts=2 ts=2 et
  autocmd FileType go         setlocal noexpandtab list tabstop=2 shiftwidth=2
endif

"jsx
let g:jsx_ext_required = 0
"let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1

" http://inari.hatenablog.com/entry/2014/05/05/231307
""""""""""""""""""""""""""""""
" Zenkaku
""""""""""""""""""""""""""""""
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif
""""""""""""""""""""""""""""""

"for markdown
au BufRead,BufNewFile *.md set filetype=markdown

filetype on

""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif
