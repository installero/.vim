" Plugins list for vim-plug
call plug#begin('~/.vim/plugged')

" General
Plug 'ervandew/supertab'
Plug 'kien/ctrlp.vim'
Plug 'bogado/file-line'
Plug 'scrooloose/nerdcommenter'
Plug 'cohama/lexima.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-syntastic/syntastic'
Plug 'bronson/vim-trailing-whitespace'

" Snipmate
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

" Rails
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'

" Git
Plug 'tpope/vim-fugitive'
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'

" HTML
Plug 'mattn/emmet-vim'

" CSS
Plug 'alexlafroscia/postcss-syntax.vim'

" JS
Plug 'kchmck/vim-coffee-script'
Plug 'prettier/vim-prettier'

" Elixir
Plug 'elixir-lang/vim-elixir'

call plug#end()
