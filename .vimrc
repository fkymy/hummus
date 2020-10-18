" Skip initialization for vim-tiny or vim-small.
if 0 | endif

" Be iMproved
if &compatible
  set nocompatible
endif

filetype off

" Required:
filetype plugin indent on

set noeb vb t_vb=
set mouse=a
set clipboard+=unnamed
set clipboard=unnamed
imap <C-p>  <ESC>"*pa
set showcmd
set list
set listchars=tab:>\ ,extends:<
set incsearch
set hlsearch
set ignorecase
set title
set number
set ruler
set laststatus=2

""""""""""""""""""""""""""""""
" Colors
""""""""""""""""""""""""""""""
syntax on

""""""""""""""""""""""""""""""
" Indents
""""""""""""""""""""""""""""""
set tabstop=4
set shiftwidth=4
set autoindent
set noexpandtab

"credits: https://github.com/yuroyoro/dotfiles/blob/master/.vimrc.indent
if has("autocmd")
  filetype plugin on
  filetype indent on

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
  autocmd FileType go         setlocal noexpandtab list tabstop=2 shiftwidth=2
endif

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

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif
