" nmap: only map in normal mode
" vmap: only map in visual mode
" imap: only map in insert mode

"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.
filetype off " required for Vundle

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

Bundle 'tpope/vim-unimpaired'

Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'

Bundle 'Lokaltog/vim-easymotion'
"Bundle 'tommcdo/vim-exchange'

Bundle 'regedarek/ZoomWin'

Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails.git'

" rbenv ctags <version>
Bundle 'tpope/rbenv-ctags'

Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-dispatch'
Bundle 'godlygeek/tabular'

"Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'ivalkeen/vim-ctrlp-tjump'
Bundle 'rking/ag.vim'
Bundle 'majutsushi/tagbar'
Bundle 'tpope/vim-surround'
Bundle 'artnez/vim-wipeout'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'dsawardekar/ember.vim'

"Bundle 'nelstrom/vim-textobj-rubyblock'
"let g:pathogen_disabled = []

set shell=$SHELL

if has("gui_running")
  set guifont=Droid\ Sans\ Mono\ for\ Powerline:h14

  let g:airline_powerline_fonts = 1
  let g:airline_enable_syntastic = 0
  let g:airline_theme = 'light'
  let g:airline_exclude_preview = 1

  set guioptions-=m "no menu
  set guioptions-=T "no toolbar
  set guioptions-=r "no scrollbar
  set guioptions-=R
  set guioptions-=l
  set guioptions-=L

  set background=dark
  color molokai
else
  set background=dark
  color molokai
endif

syntax on
filetype plugin indent on

runtime macros/matchit.vim

"set nobackup
set backupdir=$HOME/.vim/.backups
set directory=$HOME/.vim/.backups
set autoread
set clipboard+=unnamed

set history=5000
set nocompatible "do not use vi-compatibility
set showcmd " show partial commands
set showmode "show the mode you're in
set encoding=utf-8

set visualbell "no beeping

set nowrap "don't display lines continues on the next line
           "when they don't fit the screen
set tabstop=2 shiftwidth=2
set expandtab "use spaces, not tabs
set backspace=indent,eol,start " backspace through everything in insert mode
set nu
set rnu " relative numbering while the current line shows the absolute linenumber

set scrolloff=3 "show 3 lines before and after the cursor
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
"set cursorline "highlight current line
"highlight colorcolumn ctermbg=9
"execute "set colorcolumn=" . join(range(81,335), ',')
"set colorcolumn=80

set laststatus=2
set statusline=%f\ %m\%=L:\ %l/%L\ col\:\ %c\ \[buffer:\ %n\]\[%p\%%]
set title " show the current file in the terminal's window title

" Searching
set hlsearch "highlight matches
set incsearch "incremental searching
set ignorecase "searches are case insensitive...
set smartcase " ... unless they contain at least one capital letter

augroup writinggroup
  autocmd!
  autocmd BufWritePre * :%s/\s\+$//e "autoremove trailing whitespace
augroup END

let mapleader=","

nnoremap <leader>vvc :vsplit $MYVIMRC<cr>

noremap <Leader>p obinding.pry<ESC>:w<CR>
noremap <Leader>P Obinding.pry<ESC>:w<CR>

noremap <Leader>r :source $MYVIMRC<CR>
noremap <Leader>hs :nohlsearch<CR>

" some edit file commands
noremap <Leader>ew :e <C-R>=expand("%:p:h") . "/"<CR>
noremap <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
noremap <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
noremap <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

" open help in a vertical split
noremap <Leader>vh :vert help<space>

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

function! Changebackground()
  if &background == 'light'
    color molokai
    set background=dark
  else
    color hemisu
    set background=light
  endif
endfunction
nnoremap <leader>sl :call Changebackground()<CR>

" Ctrl + l to write ' => '
inoremap <c-l> <space>=><space>

nnoremap <CR> :nohlsearch<CR>

noremap <Leader>pn :ptnext<CR>
noremap <Leader>pv :ptprevious<CR>

noremap <Leader>a :Ag!<space>

" NERDTree
noremap <Leader>n :NERDTreeToggle<CR>

set splitbelow
set splitright

" vim-emoji
silent! if emoji#available()
  let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
  let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
  let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
  let g:gitgutter_sign_modified_removed = emoji#for('collision')
endif

" artnez/vim-wipeout
nnoremap <Leader>w :Wipeout<CR>

" Ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)\tags$'
let g:ctrlp_max_files = 2000

noremap <Leader>pb :CtrlPBuffer<CR>
noremap <Leader>q :bd<space>

" https://github.com/ivalkeen/vim-ctrlp-tjump
nnoremap <c-]> :CtrlPtjump<cr>

" Tagbar
let g:tagbar_autoclose = 0
nnoremap <silent> <F6> :TagbarOpen<CR>
nnoremap <Leader>t :TagbarToggle<CR>

augroup filetype_group
  autocmd!
  " Automatically wrap commit msgs to 72 cols
  autocmd Filetype gitcommit setlocal textwidth=72
augroup END

" Save when losing focus
au FocusLost * :silent! wall

" Resize splits when the window is resized
au VimResized * :wincmd =

"
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" https://github.com/kien/rainbow_parentheses.vim
" Rainbow Parenthesis (Match parentheses, etc. by color):
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

set re=1 " use the old regexp engine from Vim
set tags=./tags,tags
