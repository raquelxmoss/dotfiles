"Plugins --
call plug#begin('~/.nvim/plugged')

Plug 'vim-auto-save'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'leafgarland/typescript-vim'
" Plug 'mxw/vim-jsx'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'jszakmeister/vim-togglecursor'
Plug 'rking/ag.vim'
Plug 'FooSoft/vim-argwrap'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'neomake/neomake'
Plug 'yggdroot/indentLine'
Plug 'tpope/vim-fugitive'
Plug 'ervandew/supertab'
" Plug 'jdonaldson/vaxe'

" Theme
Plug 'MaxSt/FlatColor'
Plug 'tomasr/molokai'
Plug 'jdkanani/vim-material-theme'

" Tmux
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" Set the theme
colorscheme flatcolor
" set t_Co=256
syntax enable
highlight LineNr guibg=NONE
let g:indentLine_char = '|'
let g:indentLine_color_term = 000

" JSX highlighting on .js files
" let g:jsx_ext_required = 0

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
set clipboard=unnamed

" Watch files
set autoread

" Save on changing buffers
set autowrite

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

" linting
autocmd! BufRead,BufWritePost * Neomake

let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_ruby_enabled_makers = ['rubocop']

let g:neomake_warning_sign = {
  \ 'text': 'W',
  \ 'texthl': 'WarningMsg'
  \ }
let g:neomake_error_sign = {
  \ 'text': 'E',
  \ 'texthl': 'ErrorMsg'
  \ }

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

" Zoom around vim & tmux panes with hjkl
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

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

" Expand/Collapse arguments
nnoremap <silent> <leader>y :ArgWrap<CR>

" neomake
nmap <Leader>i :ll<CR>         " go to current error/warning
nmap <Leader>u :lnext<CR>      " next error/warning
nmap <Leader>b :lprev<CR>      " previous error/warning
