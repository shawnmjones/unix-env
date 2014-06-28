set tabstop=4 " four spaces, for Python compliance
set expandtab " no tabs!  Spaces only!
set autoindent " have VIM autoindent based on current level
"set smartindent " have VIM guess at indenting
set ls=2 " always show the status line (with filename)
set ruler " so I can see line and column numbers
"set columns=80 " so I don't go over 80, disabled because it resizes gvim
set guioptions-=T " get rid of the toolbar in GVIM, I don't use it
set nocompatible " don't be like vi, you're better than that!
syntax on " syntax highlighting on
set directory=~/.vimbackup/ " where to put backup files
set directory=~/.vimswap/ " where to put swap files
set fileformats=unix,dos,mac " support all three line endings
set noerrorbells " don't make noise

" 
set statusline=%<%f\ [%{strlen(&fenc)?&fenc:'none'}]%=\ %h%m%r%=%-14.(%l,%c%V%)\ %b\ %p\ %o
hi User1 term=inverse,bold cterm=inverse,bold ctermfg=red
fixdel

set vb " turn on the visual bell rather than the audio one
set showmatch " show matching brackets

map <F2> <Esc>:1,$!xmllint --format -<CR>

autocmd! BufNewFile,BufReadPre,FileReadPre Makefile so ~/.vimcf/makefile.vim
autocmd! BufNewFile,BufReadPre,FileReadPre *.py so ~/.vimcf/python.vim
autocmd! BufNewFile,BufReadPre,FileReadPre *.tex so ~/.vimcf/tex.vim
autocmd! BufNewFile,BufReadPre,FileReadPre *.R so ~/.vimcf/R.vim
autocmd! BufNewFile,BufReadPre,FilereadPre *.php so ~/.vimcf/php.vim
