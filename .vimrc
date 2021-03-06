set nocompatible

" https://github.com/junegunn/vim-plug
call plug#begin('~/.nvim/plugged')

" Languages
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-haml'
Plug 'kchmck/vim-coffee-script'
" rbenv ctags <version>
Plug 'tpope/rbenv-ctags'
Plug 'pangloss/vim-javascript'
" Plug 'ElmCast/elm-vim'
" Plug 'rhysd/vim-crystal'
" Plug 'fatih/vim-go'

" Colorschemes
Plug 'NLKNguyen/papercolor-theme'
Plug 'jacoborus/tender.vim'
Plug 'ajh17/Spacegray.vim'
Plug 'joshdick/onedark.vim'
Plug 'tomasr/molokai'
Plug 'trusktr/seti.vim'
Plug 'morhetz/gruvbox'
Plug 'romainl/Apprentice'
Plug 'albertorestifo/github.vim'
Plug 'wimstefan/Lightning'
" Plug 'rakr/vim-one'
" Plug 'w0ng/vim-hybrid'
Plug 'danilo-augusto/vim-afterglow'
Plug 'lifepillar/vim-solarized8'
" Plug 'felixhummel/setcolors.vim'
Plug 'bluz71/vim-moonfly-colors'
Plug 'tomasiser/vim-code-dark'
Plug 'zanglg/nova.vim'
Plug 'aunsira/macvim-light'
Plug 'gerardbm/vim-atomic'
Plug 'rakr/vim-two-firewatch'
Plug 'reedes/vim-colors-pencil'
Plug 'sjl/badwolf'
Plug 'ujihisa/unite-colorscheme'
Plug 'flazz/vim-colorschemes'

" Stuff
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'Lokaltog/vim-easymotion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ivalkeen/vim-ctrlp-tjump'
Plug 'ryanoasis/vim-devicons'
" Plug 'kien/rainbow_parentheses.vim'
Plug 'rking/ag.vim'
Plug 'tomtom/tcomment_vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mhinz/vim-signify'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'editorconfig/editorconfig-vim'

" Add plugins to &runtimepath
call plug#end()

" nmap: only map in normal mode
" vmap: only map in visual mode
" imap: only map in insert mode
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

" omnicomplete RoR
let g:rubycomplete_rails = 1
" =====================
" GENERAL CONFIGURATION
" =====================
set shell=/usr/local/bin/zsh\ -l

syntax on

set nobackup
set autoindent
set backspace=indent,eol,start " backspace through everything in insert mode
set clipboard+=unnamed
set directory=/tmp//,.
set expandtab " use spaces, not tabs
set formatoptions-=or " Don't add the comment prefix when I hit enter or o/O on a comment line.
set gdefault " assume the /g flag on :s substitutions to replace all matches in a line
set history=5000
set nobackup
set nowritebackup
set noswapfile
set nowrap " don't display lines continues on the next line
           " when they don't fit the screen
set nu
"set rnu " relative numbering while the current line shows the absolute linenumber
set scrolloff=1 "show 3 lines before and after the cursor
set showcmd " show partial commands
set showmode " show the mode you're in
set tabstop=2 shiftwidth=2
set visualbell " no beeping
set wildmenu
set wildmode=full

nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
" set cursorline " highlight current line
" set cursorcolumn

set laststatus=2
set statusline=%f\ %m\%=L:\ %l/%L\ col\:\ %c\ \[buffer:\ %n\]\[%p\%%]

set title " show the current file in the terminal's window title

set splitbelow
set splitright

" Searching
set grepprg=ag " Use Silver Searcher instead of grep
set hlsearch " highlight matches
set incsearch " incremental searching
set ignorecase " searches are case insensitive...
set smartcase " ... unless they contain at least one capital letter

" Incremental (“live”) :substitute
" set inccommand=split

" Autoremove trailing whitespace
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
autocmd FileType ruby,c,cpp autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

autocmd Filetype javascript setlocal ts=4 sts=4 sw=4

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
" nnoremap <F10> :NERDTreeToggle<CR>
" Do not open NERDTree at startup
" let g:NERDTreeHijackNetrw=0

" vim-emoji
" silent! if emoji#available()
"   let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
"   let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
"   let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
"   let g:gitgutter_sign_modified_removed = emoji#for('collision')
" endif

" Ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)\tags\tmp$'
let g:ctrlp_max_files = 5000

noremap <Leader>q :bd<space>

" https://github.com/ivalkeen/vim-ctrlp-tjump
nnoremap <c-]> :CtrlPtjump<cr>
" Don't open the tag quickfix-window when there's only one found
let g:ctrlp_tjump_only_silent = 1

"highlight ColorColumn ctermbg=magenta
"call matchadd('ColorColumn', '\%81v', 100)

" https://github.com/kien/rainbow_parentheses.vim
" Rainbow Parenthesis (Match parentheses, etc. by color):
" au VimEnter * RainbowParenthesesToggle
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces

" Begin a new line and exit insert mode
nnoremap <Leader>o o<ESC>
nnoremap <Leader>O O<ESC>

set re=1 " use the old regexp engine from Vim
"set tags=./tags,tags,.git/tags
set tags=.git/tags

function! Changebackground()
  if &background == 'light'
    color solarized
    set background=dark
  else
    color hemisu
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
nnoremap <leader>cb :call ChangeBackgroundTint()<CR>

function! To19Hash()
  '<,'>s/:\(\w\+\)\s=>/\1:
endfunction
vmap <leader>h :<C-U>call To19Hash()<cr>

" Markdown
function! s:Marko()
  noautocmd silent execute "!open -a \"Marko\" " . expand("%:p")
  if v:shell_error
    echohl Error
    echon "Problem opening the file."
    echohl Normal
  endif
endfunction

" fzf
noremap <Leader>f :Files<CR>
noremap ; :Buffers<CR>
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Zoom
function! s:zoom()
  if winnr('$') > 1
    tab split
  elseif len(filter(map(range(tabpagenr('$')), 'tabpagebuflist(v:val + 1)'),
                  \ 'index(v:val, '.bufnr('').') >= 0')) > 1
    tabprevious
    +tabclose
  endif
endfunction
nnoremap <silent> <leader>z :call <sid>zoom()<cr>

command! -bar -nargs=0 Marko call s:Marko()

" Alchemist
nmap <leader>h :IExHide<CR>

" vim-go
let g:go_fmt_autosave = 1

set termguicolors

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set guifont=Menlo:h13 " Macvim font
set background=dark
" color PaperColor
colorscheme seti
