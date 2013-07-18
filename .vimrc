execute pathogen#infect()
" Plugins can be extracted to a subdirectory under ~/.vim/bundle
" and it will be added to the runtimepath.

syntax on
filetype plugin indent on

set backupdir=$HOME/.vim/.backups
set directory=$HOME/.vim/.backups

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
"set nu
"set rnu " relative numbering while the current line shows the absolute linenumber

set scrolloff=3 "show 3 lines before and after the cursor
"set cursorline "highlight current line
"highlight colorcolumn ctermbg=9
"execute "set colorcolumn=" . join(range(81,335), ',')

set laststatus=2
set statusline=%f\ %m\ L:%l/%L\ col\:%c\ \[buffer:\ %n\]\[%l\/%p\%%]

" Searching
set hlsearch "highlight matches
set incsearch "incremental searching
set ignorecase "searches are case insensitive...
set smartcase " ... unless they contain at least one capital letter

autocmd BufWritePre * :%s/\s\+$//e "autoremove trailing whitespace

let mapleader=","

map ,p obinding.pry<ESC>:w<CR>
map ,P Obinding.pry<ESC>:w<CR>

map <Leader>r :source ~/.vimrc<CR>
map <Leader>hs :nohlsearch<CR>

" some edit file commands
map <Leader>ew :e <C-R>=expand("%:p:h") . "/"<CR>
map <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

" open help in a vertical split
map <Leader>vh :vert help<space>

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

set splitbelow
set splitright

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Ctrl + l to write ' => '
imap <c-l> <space>=><space>

nnoremap <CR> :nohlsearch<CR>

map <Leader>pn :ptnext<CR>
map <Leader>pv :ptprevious<CR>

" NERDTree
map <Leader>n :NERDTreeToggle<CR>

" Ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

map <Leader>pb :CtrlPBuffer<CR>

" Automatically wrap commit msgs to 72 cols
autocmd Filetype gitcommit setlocal textwidth=72
set guifont=Inconsolata_for_Powerline:h14
set background=dark
color solarized
