"call pathogen#infect()
set shell=zsh
"
set nocompatible
set nowrap
set number
set encoding=utf-8
syntax enable
set tabstop=2 shiftwidth=2
set showcmd " display incomplete commands
set showmode " show the mode you're in
set expandtab " use spaces, not tabs
set scrolloff=3 " show 3 lines before and after the cursor

set visualbell " no beeping

set backspace=indent,eol,start " backspace through everything in insert mode

"" Searching
set hlsearch " highlight matches
set incsearch " incremental searching
set ignorecase " searches are case insensitive ...
set smartcase " ... unless they contain at least one capital letter
set grepprg=ack

set cursorline

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
  colorscheme codeschool
  "colorscheme molokai
  set background=dark
  set guioptions-=T " remove top toolbar
else
  colorscheme wombat256
  set background=dark
endif

"" Font
"set guifont=Meslo\ LG\ M\ DZ:h12
set guifont=Inconsolata:h14

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

map <C-J> <C-W>j
map <C-K> <C-W>k

let g:slime_target = "tmux"
