" Appearance & interface
filetype plugin indent on      " enable filetype plugin with indent
syntax on                      " enable syntax highlighting
set number                     " show line numbers
set ruler                      " shows the status line down the bottom
set showcmd                    " show incomplete cmds down the bottom
set showmode                   " show current mode down the bottom
set gcr=a:blinkon0             " disable cursor blink
set showmatch                  " show closing braces
set list listchars=tab:\ \ ,trail:· " display trailing spaces & tabs

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

" Plugins
" export vim-plug list
if filereadable(expand("~/.vim/plug-list.vim"))
  source ~/.vim/plug-list.vim
endif

colorscheme dracula

" Change coursor color (cyan - normal, yellow - insert)
if &term =~ "xterm\\|rxvt"
  let &t_SI = "\<Esc>]12;yellow\x7"
  let &t_EI = "\<Esc>]12;cyan\x7"
  silent !echo -ne "\033]12;cyan\007"
  autocmd VimLeave * silent !echo -ne "\033]112\007"
endif

" General options
set backspace=indent,eol,start " proper backspace behavior
set hidden                     " possibility to have more than one unsaved buffers
set visualbell                 " disable sounds
set autoread                   " reload files changed outside vim
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

" Line wrapping
set wrap                       " wrap lines
set linebreak                  " wrap lines at convenient points

" Folds
set foldmethod=indent          " fold based on indent
set foldnestmax=3              " deepest fold is 3 levels
set nofoldenable               " dont fold by default

" Scrolls
set scrolloff=3         "Start scrolling when we're 3 lines away from margins
set sidescrolloff=15
set sidescroll=1

" Search
set incsearch                  " incremental search, hit '<CR>' to stop
set hlsearch                   " highlight search results
set ignorecase                 " ignore case while searching
set smartcase                  " override ignorecase while using capitals

" Autocomplete
set wildmenu                      " great command-line completion, use '<Tab>' to move around and `<CR>` to validate
set wildignore+=*/tmp/*,*/cache/*,*/log/* " ignore some stuff
set completeopt=menuone

" Navigation
runtime macros/matchit.vim " enables % jumping with intelligence (<body> → </body>, do → end)

" Ctags
set tags=./tags;/

" "line" object (from the first non-whitespace character to the last)
:vnoremap il :<c-u>normal! ^vg_<cr>
:onoremap il :normal vil<cr>

" // searches for marked text
vnoremap // y/<C-R>"<CR>

" Highlights long strings of code
highlight ColorColumn ctermbg=22
set colorcolumn=81,121

" ctrlp.vim
let g:ctrlp_map = '<c-f>'
let g:ctrlp_custom_ignore = {
  \ 'dir': 'node_modules\|deps\|build\|_build\|dist'
  \ }

" vim-rails
let g:rails_ctags_arguments = '--languages=ruby . $(bundle list --paths)'

" lexima.vim
call lexima#add_rule({'char': '«', 'input_after': '»'})
let g:lexima_map_escape = ''

" nerdcommenter
let g:NERDSpaceDelims = 1

" gist-vim
let g:gist_post_private = 1
let g:gist_show_privates = 1
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['javascript'], 'passive_filetypes': [] }
nnoremap <C-w>r :w<CR>:SyntasticCheck<CR>

" SnipMate
let g:snipMate = { 'snippet_version' : 1 }
