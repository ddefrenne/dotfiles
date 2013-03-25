execute pathogen#infect()
" Plugins can be extracted to a subdirectory under ~/.vim/bundle
" and it will be added to the runtimepath.

syntax on
filetype plugin indent on

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
set rnu " relative numbering while the current line shows the absolute linenumber

set scrolloff=3 "show 3 lines before and after the cursor
set cursorline "highlight current line

set laststatus=2
set statusline=%f\ %m\ %l/%L\ col\:%c

" Searching
set hlsearch "highlight matches
set incsearch "incremental searching
set ignorecase "searches are case insensitive...
set smartcase " ... unless they contain at least one capital letter

autocmd BufWritePre * :%s/\s\+$//e "autoremove trailing whitespace
"autocmd VimEnter * silent! :!ruby ~/.vim/tagfile.rb $(pwd) &> /dev/null

map ,p obinding.pry<ESC>:w<CR>
map ,P obinding.pry<ESC>:w<CR>

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

" NERDTree
map <Leader>n :NERDTreeToggle<CR>

" Ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

map <Leader>pb :CtrlPBuffer<CR>

set guifont=Inconsolata:h14
color molokai
