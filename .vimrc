set nocompatible

" nmap: only map in normal mode
" vmap: only map in visual mode
" imap: only map in insert mode

" Brief help
" :PluginList          - list configured bundles
" :PluginInstall(!)    - install (update) bundles
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin commands are not allowed.
filetype off " required for Vundle

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'VundleVim/Vundle.vim'

" Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-fugitive'
" Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-haml'
" rbenv ctags <version>
Plugin 'tpope/rbenv-ctags'

Plugin 'airblade/vim-gitgutter'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'regedarek/ZoomWin'
Plugin 'vim-ruby/vim-ruby'
Plugin 'kien/ctrlp.vim'
Plugin 'ivalkeen/vim-ctrlp-tjump'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'rking/ag.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tomtom/tcomment_vim'

Plugin 'lifepillar/vim-solarized8'
Plugin 'chriskempson/tomorrow-theme'
Plugin 'joshdick/onedark.vim'
Plugin 'ajh17/Spacegray.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'slashmili/alchemist.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'lambdatoast/elm.vim'
Plugin 'jacoborus/tender.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" ========
" Ruby
" ========
augroup myfiletypes
  " Clear old autocmds in group
  autocmd!

  autocmd FileType ruby,eruby,yaml setlocal ai sw=2 sts=2 et
  autocmd FileType ruby,eruby,yaml setlocal path+=lib

  " Make ?s part of words
  autocmd FileType ruby,eruby,yaml setlocal iskeyword+=?
augroup END

" Enable built-in matchit plugin
runtime macros/matchit.vim

" =====================
" GENERAL CONFIGURATION
" =====================
" Needs to be Bash to make Dispatch/RSpec.vim/something else happy
set shell=/bin/bash\ -l

if has("gui_running")
  set guifont=Hack:h11
  set anti

  set guioptions-=m "no menu
  set guioptions-=T "no toolbar
  set guioptions-=r "no scrollbar
  set guioptions-=R
  set guioptions-=l
  set guioptions-=L

  set background=light
  coloscheme spacegray
else
  set background=dark
  colorscheme Tomorrow-Night-Bright
endif

syntax on

set termguicolors
set nobackup
set autoread
set autoindent
set backspace=indent,eol,start " backspace through everything in insert mode
set backupdir=$HOME/.vim/.backups
set clipboard+=unnamed
set directory=$HOME/.vim/.backups
set encoding=utf-8
set expandtab "use spaces, not tabs
set formatoptions-=or " Don't add the comment prefix when I hit enter or o/O on a comment line.
set gdefault " assume the /g flag on :s substitutions to replace all matches in a line
set history=5000
set nobackup
set noswapfile
" set nowrap "don't display lines continues on the next line
"            "when they don't fit the screen
set wrap
set breakindent
set nu
set rnu " relative numbering while the current line shows the absolute linenumber
set scrolloff=3 "show 3 lines before and after the cursor
set showcmd " show partial commands
set showmode "show the mode you're in
set tabstop=2 shiftwidth=2
set visualbell "no beeping

nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
set cursorline "highlight current line
"highlight colorcolumn ctermbg=9
"execute 'set colorcolumn=' . join(range(81,335), ',')
set colorcolumn=80
set cursorcolumn

set laststatus=2
set statusline=%f\ %m\%=L:\ %l/%L\ col\:\ %c\ \[buffer:\ %n\]\[%p\%%]

set title " show the current file in the terminal's window title

set splitbelow
set splitright

" Searching
set grepprg=ag " Use Silver Searcher instead of grep
" configure ag.vim to always start searching from your project root instead of the cwd
let g:ag_working_path_mode="r"
set hlsearch "highlight matches
set incsearch "incremental searching
set ignorecase "searches are case insensitive...
set smartcase " ... unless they contain at least one capital letter

" Autoremove trailing whitespace
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
autocmd FileType ruby,c,cpp autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" Automatically wrap commit msgs to 72 cols
augroup filetype_group
  autocmd!
  autocmd Filetype gitcommit setlocal textwidth=72
augroup END

" Reload when focusing on a buffer
au FocusGained,BufEnter * :silent! !
" Resize splits when the window is resized
au VimResized * :wincmd =

let mapleader=","

autocmd Filetype javascript setlocal ts=4 sts=4 sw=4

noremap <Leader>p obinding.pry<ESC>:w<CR>
noremap <Leader>P Obinding.pry<ESC>:w<CR>

noremap <Leader>r :source $MYVIMRC<CR>
noremap <Leader>hs :nohlsearch<CR>
nnoremap <CR> :nohlsearch<CR>

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

" Ctrl + l to write ' => '
inoremap <c-l> <space>=><space>

noremap <Leader>pn :ptnext<CR>
noremap <Leader>pv :ptprevious<CR>

noremap <Leader>a :Ag!<space>

" *.rabl should be considered Ruby
au BufNewFile,BufRead *.rabl set filetype=ruby

" NERDTree
noremap <Leader>n :NERDTreeToggle<CR>
" Do not open NERDTree at startup
let g:NERDTreeHijackNetrw=0

" vim-emoji
silent! if emoji#available()
  let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
  let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
  let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
  let g:gitgutter_sign_modified_removed = emoji#for('collision')
endif

" Ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)\tags\tmp$'
let g:ctrlp_max_files = 5000

noremap <Leader>pb :CtrlPBuffer<CR>
noremap <Leader>q :bd<space>

" https://github.com/ivalkeen/vim-ctrlp-tjump
nnoremap <c-]> :CtrlPtjump<cr>
" Don't open the tag quickfix-window when there's only one found
let g:ctrlp_tjump_only_silent = 1

" Tagbar
let g:tagbar_autoclose = 0
nnoremap <silent> <F6> :TagbarOpen<CR>
nnoremap <Leader>t :TagbarToggle<CR>

" RSpec.vim
let g:rspec_command = "Dispatch rspec {spec}"
nnoremap <Leader>rc :call RunCurrentSpecFile()<CR>
nnoremap <Leader>rn :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>

nnoremap <F9> :Dispatch<CR>

" Townk/vim-autoclose
let g:AutoClosePairs = "[] () {} <> \""

" https://github.com/kien/rainbow_parentheses.vim
" Rainbow Parenthesis (Match parentheses, etc. by color):
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Begin a new line and exit insert mode
nnoremap <Leader>o o<ESC>
nnoremap <Leader>O O<ESC>

set re=1 " use the old regexp engine from Vim
"set tags=./tags,tags,.git/tags
set tags=.git/tags

function! Changebackground()
  if &background == 'light'
    colorscheme solarized8_dark_high
    set background=dark
  else
    colorscheme solarized8_light_high
    set background=light
  endif
endfunction
nnoremap <leader>sl :call Changebackground()<CR>

function! ChangeBackgroundTint()
  if &background == 'light'
    set background=dark
  else
    set background=light
  endif
endfunction
nnoremap <Leader>cb :call ChangeBackgroundTint()<CR>

function! To19Hash()
  '<,'>s/:\(\w\+\)\s=>/\1:
endfunction
vmap <leader>h :<C-U>call To19Hash()<cr>

let g:airline_powerline_fonts = 1
let g:airline_theme = "papercolor"
" leuke: dracula, xtermlight, solarized

set shell=zsh
