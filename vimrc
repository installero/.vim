" filetype support and syntax highlighting
filetype plugin indent on      " enable filetype plugin with indent
syntax on                      " enable syntax highlighting

" general (form idiomatic-vimrc)
set backspace=indent,eol,start " proper backspace behavior
set hidden                     " possibility to have more than one unsaved buffers
set ruler                      " shows the status line down the bottom

" general (from dotfiles/vimrc)
set number                     " show line numbers
set showcmd                    " show incomplete cmds down the bottom
set showmode                   " show current mode down the bottom
set gcr=a:blinkon0             " disable cursor blink
set visualbell                 " disable sounds
set autoread                   " reload files changed outside vim

" general (from my old .vimrc)
set showmatch                  " show closing braces
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

" Turn Off Swap Files
set noswapfile
set nobackup
set nowb

" Persistent Undo
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" Indentation
set autoindent                 " automatic indenting for buffers not associated with a filetype
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Display tabs
set list listchars=tab:\ \ ,trail:·

" Line wrapping
set wrap                       " wrap lines
set linebreak                  " wrap lines at convenient points

" Folds
set foldmethod=indent          " fold based on indent
set foldnestmax=3              " deepest fold is 3 levels
set nofoldenable               " dont fold by default

" Scrolls
set scrolloff=3         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" Search
set incsearch                  " incremental search, hit '<CR>' to stop
set hlsearch                   " highlight search results
set ignorecase                 " ignore case while searching
set smartcase                  " override ignorecase while using capitals

" Appearance
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

colorscheme apprentice

" Change coursor shape (for some terminals only)
if has("autocmd")
  au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
  au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
endif

" Change coursor color (red - normal, orange - insert)
if &term =~ "xterm\\|rxvt"
  let &t_SI = "\<Esc>]12;orange\x7"
  let &t_EI = "\<Esc>]12;red\x7"
  silent !echo -ne "\033]12;red\007"
  autocmd VimLeave * silent !echo -ne "\033]112\007"
endif

" Autocomplete
set wildmenu                   " great command-line completion, use '<Tab>' to move around and `<CR>` to validate
set completeopt=menuone

" export vim-plug list
if filereadable(expand("~/.vim/plug-list.vim"))
  source ~/.vim/plug-list.vim
endif

" Navigation
runtime macros/matchit.vim " enables % jumping with intelligence (<body> → </body>, do → end)
