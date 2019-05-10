set nocompatible

" https://github.com/junegunn/vim-plug
call plug#begin('~/.nvim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Languages
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
" Plug 'rust-lang/rust.vim'
Plug 'vim-ruby/vim-ruby'

Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-haml'
Plug 'pangloss/vim-javascript'

" Colorschemes
" Plug 'NLKNguyen/papercolor-theme'
Plug 'rakr/vim-one'
Plug 'aonemd/kuroi.vim'
Plug 'wimstefan/Lightning'
Plug 'endel/vim-github-colorscheme'
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'

" Linters Plug 'maksimr/vim-jsbeautify' post install (yarn install | npm install) then load plugin only for editing supported files
" Plug 'prettier/vim-prettier', { \ 'do': 'yarn install', \ 'for': ['javascript',
" 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] }

" Plug 'w0rp/ale'

Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'Lokaltog/vim-easymotion'
Plug 'mileszs/ack.vim'
Plug 'tomtom/tcomment_vim'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-markdown'
Plug 'vim-airline/vim-airline'

" Add plugins to &runtimepath
call plug#end()

" nmap: only map in normal mode vmap: only map in visual mode imap: only map
" in insert mode

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!

  autocmd FileType ruby,eruby,yaml setlocal ai sw=2 sts=2 et
  autocmd FileType ruby,eruby,yaml setlocal path+=lib
  autocmd FileType typescript setlocal sw=4 sts=4
  autocmd FileType go setlocal tabstop=4 sw=4 sts=4

  " Make ?s part of words
  autocmd FileType ruby,eruby,yaml setlocal iskeyword+=?
augroup END

" Enable built-in matchit plugin
runtime macros/matchit.vim

" ===================== GENERAL CONFIGURATION =====================
" Needs to be Bash to make Dispatch/RSpec.vim/something else happy
" set shell=/bin/bash\ -l
set shell=/usr/local/bin/zsh\ -l

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

syntax on

set autoindent
set backspace=indent,eol,start " backspace through everything in insert mode
set breakindent
set clipboard+=unnamed
set directory=/tmp//,.
set expandtab "use spaces, not tabs
set formatoptions-=or " Don't add the comment prefix when I hit enter or o/O on a comment line.
set gdefault " assume the /g flag on :s substitutions to replace all matches in a line
set history=5000
set nobackup
set noswapfile
set nowrap "don't display lines continues on the next line
           "when they don't fit the screen
set nowritebackup

set nu
"set rnu " relative numbering while the current line shows the absolute linenumber
"
"show 3 lines before and after the cursor
set scrolloff=1 
set showcmd " show partial commands

set tabstop=2 shiftwidth=2
set visualbell "no beeping

" Move with 3 lines
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

set cursorline "highlight current line / slows scrolling down though :(

" set statusline=%f\ %m\%=L:\ %l/%L\ col\:\ %c\ \[buffer:\%n\]\[%p\%%]

set title " show the current file in the terminal's window title

set splitbelow
set splitright

" Searching
set hlsearch "highlight matches
set incsearch "incremental searching
" set ignorecase "searches are case insensitive...
set smartcase " ... unless they contain at least one capital letter

" Autoremove trailing whitespace
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
autocmd FileType ruby,c,cpp autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

autocmd FileType javascript setlocal ts=4 sts=4 sw=4

" Automatically wrap commit msgs to 80 cols
augroup filetype_group
  autocmd!
  autocmd FileType gitcommit setlocal textwidth=80
augroup END

" Reload when focusing on a buffer
au FocusGained,BufEnter * :silent! !
" Resize splits when the window is resized
au VimResized * :wincmd =

" http://devonestes.herokuapp.com/everything-you-need-to-know-about-elixirs-new-formatter
autocmd BufWritePost *.exs silent :!mix format %
autocmd BufWritePost *.ex silent :!mix format % 
autocmd FileType elixir setlocal formatprg=mix\ format\ -

autocmd BufWritePost *.rs silent :!cargo fmt
autocmd BufWritePost *.rs silent :e
autocmd FileType rust setlocal formatprg=cargo\ fmt\

let mapleader=","

noremap <Leader>p obinding.pry<ESC>:w<CR>
noremap <Leader>P Obinding.pry<ESC>:w<CR>

noremap <Leader>r :source $MYVIMRC<CR> 
nnoremap <CR> :nohlsearch<CR>

" some edit file commands
noremap <Leader>ew :e <C-R>=expand("%:p:h") . "/"<CR>
noremap <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
noremap <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
noremap <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Terminal Map ESC to C-\ C-n (to go to normal mode in terminal)
tnoremap <Esc> <C-\><C-n>

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

noremap <Leader>pn :ptnext<CR>
noremap <Leader>pv :ptprevious<CR>

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
" command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

let g:ackprg = 'rg --vimgrep --no-heading'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack
noremap <Leader>a :Ack!<space>

" *.rabl should be considered Ruby
au BufNewFile,BufRead *.rabl set filetype=ruby

" Begin a new line and exit insert mode
nnoremap <Leader>o o<ESC>
nnoremap <Leader>O O<ESC>

set re=1 " use the old regexp engine from Vim
"set tags=./tags,tags,.git/tags
set tags=.git/tags

function! ChangeBackgroundTint()
  if &background == 'light'
    set background=dark
  else
    set background=light
  endif
endfunction

nnoremap <leader>cbt :call ChangeBackgroundTint()<CR>

" Zoom
function! s:zoom()
  if winnr('$') > 1
    tab split
  elseif
    len(filter(map(range(tabpagenr('$')), 'tabpagebuflist(v:val + 1)'),
             \ 'index(v:val, '.bufnr('').') >= 0')) > 1 tabprevious +tabclose
  endif
endfunction
nnoremap <silent> <leader>z :call <sid>zoom()<cr>

" Alchemist
nmap <leader>h :IExHide<CR>

" fzf
noremap <Leader>f :Files<CR>
noremap <Leader>b :Buffers<CR>
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \ 'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \ <bang>0 ? fzf#vim#with_preview('up:60%')
  \         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \ <bang>0)

" Deoplete
let g:deoplete#enable_at_startup = 1

augroup insertload
  autocmd!
  autocmd InsertEnter * call deoplete#enable() | autocmd! insertload
augroup END

" Required for operations modifying multiple buffers like rename.
set hidden

"Credit joshdick Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 <
"https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) <
"https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
"< https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

" Do not wait for escape sequences in insert mode.  Waiting causes a delay
" when changing modes by pressing ESC.
"set esckeys

set background=dark
colorscheme one

" let g:gruvbox_contrast_dark = "medium"

" determine whether inactive windows should have the left section collapsed to
" only the filename of that buffer.
let g:airline_inactive_collapse=1
