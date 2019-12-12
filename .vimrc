" Plugins
call plug#begin('~/.nvim/plugged')

Plug '907th/vim-auto-save'
Plug 'scrooloose/nerdtree'
" Plug 'airblade/vim-gitgutter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'othree/es.next.syntax.vim' " es7
" Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
" Plug 'isRuslan/vim-es6'
Plug 'posva/vim-vue'
" Plug 'othree/javascript-libraries-syntax.vim'
" Plug 'leafgarland/typescript-vim'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'rking/ag.vim'
Plug 'FooSoft/vim-argwrap'
Plug 'tpope/vim-commentary'
Plug 'neomake/neomake'
Plug 'yggdroot/indentLine'
Plug 'neovimhaskell/haskell-vim'
Plug 'roman/golden-ratio'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive' " Gblame, amongst other git stuff
Plug 'tpope/vim-abolish'
Plug '~/Projects/vim-argwrap'
" Theme
"
"
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'MaxSt/FlatColor'
" Plug 'tomasr/molokai'
" Plug 'jdkanani/vim-material-theme'

" Tmux
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

" Set the theme
" let g:flatcolor_termcolors = 16
let g:dracula_colorterm = 0
" let g:dracula_italic = 0
" colorscheme flatcolor
color dracula

syntax enable
highlight Comment cterm=italic

let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
highlight ExtraWhitespace ctermbg='white'

" set termguicolors

filetype plugin indent on
highlight LineNr guibg=NONE
let g:indentLine_char = '|'
let g:indentLine_color_term = 240
" let g:gitgutter_max_signs = 500
" let g:gitgutter_map_keys = 0
highlight clear LineNr
" highlight clear SignColumn
" highlight LineNr ctermfg=blue

" Thanks to http://superuser.com/questions/558876/how-can-i-make-the-sign-column-show-up-all-the-time-even-if-no-signs-have-been-a
autocmd BufEnter * sign define dummy
autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')

" JSX highlighting on .js files
augroup filetype javascript syntax=javascript
let g:jsx_ext_required = 0
let g:used_javascript_libs = 'react'

" Encoding
set encoding=utf-8

" Linenumbers
set number
set relativenumber

" Better seaching
set hlsearch
set ignorecase
set smartcase
let g:ag_working_path_mode="r"

" 2 space tabs
set expandtab
set tabstop=2
set shiftwidth=2

" Splits
set splitright
set splitbelow

" History
set nowritebackup
set history=10000
set noswapfile
set nobackup

" Mouse
set mouse=a
set ttyfast

" Use system clipboard
set clipboard=unnamedplus

" Watch files
set autoread

" Save on changing buffers
" set autowrite

" Display command
set showcmd

" visual autocomplete for command menu
set wildmenu

" Extend our undoable steps and preserve over restart (if available)
if has('persistent_undo')
  set undodir=$TMPDIR,~/tmp,~/.vim/tmp,/tmp,/var/tmp
  set undofile
  set undoreload=10000
end
set undolevels=10000

" FZF
noremap <c-p> :FZF<CR>

"vim-auto-save
let g:auto_save = 1  " enable AutoSave
let g:auto_save_silent = 1  " do not display the auto-save notification
let g:auto_save_in_insert_mode = 0

" statusline
" set statusline = "%{FugitiveStatusline()}"
" linting
"
"
autocmd! BufReadPost,BufWritePost * Neomake

call neomake#configure#automake('w')
" call neomake#configure#automake('nw', 750)

let g:neomake_javascript_enabled_makers = ['eslint']

let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'

let g:neomake_logfile = '/tmp/neomake.log'
let g:neomake_ruby_enabled_makers = ['rubocop', 'mri']

let g:neomake_place_signs = 1
" Vue
let g:vue_disable_pre_processors=1

" Haskell syntax
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
let g:haskell_indent_if = 3
let g:haskell_indent_case = 2
let g:haskell_indent_let = 4
let g:haskell_indent_where = 6
let g:haskell_indent_before_where = 2
let g:haskell_indent_after_bare_where = 2
let g:haskell_indent_do = 3
let g:haskell_indent_in = 1
let g:haskell_indent_guard = 2

let g:argwrap_padded_braces = '{'

" Set leader to space
nmap <space> <leader>
nmap <space><space> <leader><leader>
" xmap includes Visual mode but not Select mode (which we don't often use, but
" if we did we'd expect hitting space to replace the selected text with a
" space char).
xmap <space> <leader>

noremap <leader>l :NERDTreeToggle<CR>

" insert lines without entering insert mode
noremap <leader>o o<Esc>k
noremap <leader>O O<Esc>j

imap kj <Esc>:w<CR>
imap jj <Esc>:w<CR>

" Zoom around vim & tmux panes with hjkl
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>


noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Add semicolon at end of line
noremap ; A;<Esc>

" Add comma at end of line
noremap , A,<Esc>

noremap <Leader><Leader> i<space><Esc>
" Expand/Collapse arguments
nnoremap <silent> <leader>y :ArgWrap<CR>

" neomake
nmap <Leader>i :ll<CR>         " go to current error/warning
nmap <Leader>u :lnext<CR>      " next error/warning
nmap <Leader>b :lprev<CR>      " previous error/warning

" Autocomplete with tab
inoremap <Tab> <C-N>

" Hit Tab to go to the next tab
noremap <Tab> gt
