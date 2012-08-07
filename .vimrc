"call pathogen#infect()
set shell=zsh
"
set nocompatible "do not use vi-compatibility
set encoding=utf-8

set nowrap " don't display lines continues on the next line when they don't fit on the screen
"set number "show linenumbers
set rnu "show relative linenumbers
set textwidth=0 " don't break a line after a certain number of chars has been met
syntax enable
"set noswapfile

set expandtab " use spaces, not tabs
set tabstop=2 " 1 tab == 2 spaces
set shiftwidth=2 " controls how many columns text is indented with >> and <<

set showcmd " display incomplete commands
set showmode " show the mode you're in
set scrolloff=3 " show 3 lines before and after the cursor

set visualbell " no beeping

set backspace=indent,eol,start " backspace through everything in insert mode

"" Searching
set hlsearch " highlight matches
set incsearch " incremental searching
set ignorecase " searches are case insensitive ...
set smartcase " ... unless they contain at least one capital letter
set grepprg=ack " use Ack when calling :grep

set colorcolumn=80 "show vertical line on column 80
set cursorline " highlight current line

filetype plugin indent on " load file type plugins + indentation

" solarized options
" soms zijn er toch problemen met Solarized en de kleuren. Gebruik dan:
" se t_Co=16 (NIET set, maar se)
se t_Co=256
"let g:solarized_termcolors = 16
"let g:solarized_termcolors = 256 " bij gebruik van een niet solarized-colored terminal
"let g:solarized_visibility = "high"
"let g:solarized_contrast = "high"

if has("gui_running")
  set guioptions=egmrt
  "colorscheme pyte
  "colorscheme codeschool
  colorscheme molokai
  set background=dark
  "colorscheme solarized
  set guioptions-=T " remove top toolbar
else
  colorscheme wombat256
  set background=dark
endif

"" Font
"set guifont=Meslo\ LG\ M\ DZ:h12
set guifont=Inconsolata:h14

"Switch between relative and absolute line numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunction

nnoremap <C-n> :call NumberToggle()<cr>

:au FocusLost * :set number
:au FocusGained * :set relativenumber

" change color of the cursor depending on the mode
if &term =~ "^xterm"
  :silent !echo -ne "\033]12;red\007"
  let &t_SI = "\033]12;orange\007"
  let &t_EI = "\033]12;red\007"
  autocmd VimLeave * :!echo -ne "\033]12;red\007"
endif

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

" set grepprg=ack\ -a

cmap <C-F12> :SyntasticToggleMode<CR>

map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l

let g:slime_target = "tmux"
