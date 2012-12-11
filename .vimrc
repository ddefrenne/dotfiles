set shell=sh

set hidden " makes vim work like every other multuple-file editor
set nocompatible " do not use vi-compatibility
set encoding=utf-8
filetype plugin indent on " load file type plugins + indentation

set autoread " autoload a file when changed from the outside (like when resetting a file with git)

syntax enable

set showcmd " show partial commands
set showmode " show the mode you're in
if $TMUX == ''
  set clipboard=unnamed " all operations work with the OS clipboard
endif

" Whitespace
set nowrap " don't display lines continues on the next line when they don't fit the screen
set tabstop=2 shiftwidth=2
set expandtab " use spaces, not tabs
"set wrap
"set showbreak="\ \ \ \ \ "
"set breakat=" ^I!*-+;:,./?"
"set linebreak
"set number " show linenumbers
set rnu "show relative line numbers

set backspace=indent,eol,start " backspace through everything in insert mode

set scrolloff=3 " show 3 lines before and after the cursor
set colorcolumn=80,120 " show vertical line on columns 80 & 120
set cursorline " highlight current line
set cursorcolumn " highlight current column

set visualbell " no beeping

"" Searching
set hlsearch " highlight matches
set incsearch " incremental searching
set ignorecase " searches are case insensitive ...
set smartcase " ... unless they contain at least one capital letter

" --nogroup tells Ack to output the linenumber
" --column tells Ack to output the column number
"set grepprg=ack\ --nogroup\ --column\ --ignore-dir=tmp\ --ignore-dir=coverage\ --ignore-dir=log\ $*
" %c matches the column number
" $* is replaced with any arguments supplied to the :grep command
" %f matches the filename
" %l matches the linenumber
" %m matches the text on the line
set grepformat=%f:%l:%c:%m

" SOLARIZED OPTIONS
" soms zijn er toch problemen met Solarized en de kleuren. Gebruik dan:
" se t_Co=16 (NIET set, maar se)
set t_Co=256
"let g:solarized_termcolors = 256 " bij gebruik van een niet solarized-colored terminal
"let g:solarized_visibility = "high"
"let g:solarized_contrast = "high"

if has("gui_running")
  set guioptions-=T " remove top toolbar
  set columns=240
  colorscheme molokai
else
  colorscheme solarized
endif
set background=dark

"" Font
set guifont=Inconsolata:h14

" change color of the cursor depending on the mode
if &term =~ "^xterm"
  :silent !echo -ne "\033]12;red\007"
  let &t_SI = "\033]12;orange\007"
  let &t_EI = "\033]12;red\007"
  autocmd VimLeave * :!echo -ne "\033]12;red\007"
endif

" Switch between relative and absolute line numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunction

nnoremap <C-n> :call NumberToggle()<cr>

":au FocusLost * :set number
":au FocusGained * :set relativenumber

" THE FOLLOWING ONLY WORKS IN GRAPHICAL MODE
" Change cursor shape depending on the mode
" &t_SI insert mode
" &t_EI other modes
if &term =~ '^xterm'
  " 1 or 0 -> blinking block
  " 2 -> solid block
  " 3 -> blinking underscore
  " 4 -> solid underscore
  let &t_SI = "\<Esc>[3"
  let &t_EI = "\<Esc>[3"
endif

autocmd BufWritePre * :%s/\s\+$//e " autoremove trailing whitespace

map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l

" mapping for ctags
:nnoremap <f6> :!ctags -R --exclude=log --exclude=coverage --exclude=.git -h 'rb.js.coffee.scss.css.html.haml.yml.erb'<CR>

" add 'binding.pry' on a new line below the current one
:map ,p obinding.pry<ESC>:w<CR>
" add 'binding.pry' on a new line above the current one
:map ,P Obinding.pry<ESC>:w<CR>

" bindings for screen.vim
let g:ScreenImpl = 'Tmux'
map <F4> :ScreenShellVertical<CR>
command -nargs=? -complete=shellcmd W :w | :call ScreenShellSend("load '".@%."';")
map <Leader>r :w<CR> :call ScreenShellSend("rspec ".@% . ':' . line('.'))<CR>
map <Leader>e :w<CR> :call ScreenShellSend("cucumber --format=pretty ".@% . ':' . line('.'))<CR>
map <Leader>b :w<CR> :call ScreenShellSend("break ".@% . ':' . line('.'))<CR>
