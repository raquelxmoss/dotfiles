" Plugins
call plug#begin('~/.nvim/plugged')

Plug '907th/vim-auto-save'
Plug 'scrooloose/nerdtree'
Plug 'ntpeters/vim-better-whitespace'
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'othree/es.next.syntax.vim' " es7
Plug 'mxw/vim-jsx'
Plug 'posva/vim-vue'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'rking/ag.vim'
Plug 'FooSoft/vim-argwrap'
Plug 'tpope/vim-commentary'
Plug 'dense-analysis/ale'
Plug 'yggdroot/indentLine'
Plug 'neovimhaskell/haskell-vim'
Plug 'roman/golden-ratio'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive' " Gblame, amongst other git stuff
Plug 'tpope/vim-abolish'
Plug 'ervandew/supertab'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'MaxSt/FlatColor'
Plug 'easymotion/vim-easymotion'
Plug 'ludovicchabant/vim-gutentags'

" Tmux
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

" Set the theme
let g:dracula_colorterm = 0
" let g:dracula_italic = 0
color dracula

syntax enable
highlight Comment cterm=italic

" no idea what those do, turning them off for a while
" let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
"
highlight ExtraWhitespace ctermbg='white'

" set termguicolors

filetype plugin indent on
highlight LineNr guibg=NONE
let g:indentLine_char = '|'
let g:indentLine_color_term = 240
highlight clear LineNr

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
set autowrite

" Display command
set showcmd

" visual autocomplete for command menu
set wildmenu

set updatetime=750

" after flailing around with ctags, it made my autocomplete unusable
" this is a hack to make vim ignore whatever tags file ctags generated
" which I can't even find. Until I figure that out, here we are
" :upsidedown_smile:
" set tags=""
set statusline+=%{gutentags#statusline()}

" Extend our undoable steps and preserve over restart (if available)
if has('persistent_undo')
  set undodir=$TMPDIR,~/tmp,~/.vim/tmp,/tmp,/var/tmp
  set undofile
  set undoreload=10000
end
set undolevels=10000

" FZF
noremap <c-p> :Files<CR>
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
command! -bang -nargs=? -complete=dir Files
     \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

"vim-auto-save
let g:auto_save = 1  " enable AutoSave
let g:auto_save_silent = 0  " do not display the auto-save notification
let g:auto_save_in_insert_mode = 0
" potentially add 'InsertLeave' back to save_events
let g:auto_save_events = ["CursorHold"]

" linting
"
let b:ale_fixers = ['prettier', 'eslint', 'rubocop']
let g:ale_sign_column_always = 1
" let g:ale_lint_delay

" Vue
let g:vue_disable_pre_processors=1

" Argwrap specific settings
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
imap jj <Esc>:nohl<CR>

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
nmap <silent> <leader>ev :e ~/.vimrc<CR>
nmap <silent> <leader>sv :so ~/.vimrc<CR>

" Remove search highlighting
nmap <silent> <leader>jj :nohl<CR>

" Add semicolon at end of line
noremap ; A;<Esc>

" Add comma at end of line
noremap , A,<Esc>

noremap ff i<space><Esc>
noremap FF a<space><Esc>

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
