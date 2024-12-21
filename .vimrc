set t_Co=256   " Use 256 colors

set termguicolors
if has('termguicolors')
  set t_Co=256  " Tell Vim that 256 colors are supported
endif


set t_Co=256   " Use 256 colors

set termguicolors
if has('termguicolors')
  set t_Co=256  " Tell Vim that 256 colors are supported
endif



" Correct RGB escape codes for vim inside tmux
if !has('nvim') && $TERM ==# 'screen-256color'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

set clipboard=unnamedplus

" Ctrl + F to open search prompt
nnoremap <C-f> /

" Ctrl + F in insert mode to start search
inoremap <C-f> <Esc>/

" Use Ctrl + A to select all text
nnoremap <C-a> ggVG

" Map Ctrl + S to save the file in Normal mode
nnoremap <C-s> :w<CR>

" Map Ctrl + S to save the file in Insert mode with a confirmation message
inoremap <C-s> <Esc>:w<CR>:echo 'File Saved'<CR>


" Use system clipboard for copy and paste
vnoremap <C-c> "+y        " Copy selected text to system clipboard
nnoremap <C-v> "+p        " Paste from system clipboard
inoremap <C-v> <C-O>"+p   " Paste from system clipboard in insert mode

" Map Ctrl + Shift + C to copy to clipboard
map <C-S-C> "+y

" Map Ctrl + Shift + V to paste from clipboard
map <C-S-V> "+p


" Move selected lines up with Alt+Shift+Up in visual mode
vmap <A-S-Up> :move '<-2<CR>gv

" Move selected lines down with Alt+Shift+Down in visual mode
vmap <A-S-Down> :move '>+1<CR>gv

" Highlight all instances of the selected word in visual mode
" vnoremap <silent> <leader>h :<C-u>execute 'match Search /\V' . escape(@", '/\')<CR>



set nocompatible
call plug#begin('~/.vim/plugged')
" Add the vim-code-dark plugin
"Plug 'tomasiser/vim-code-dark'

" Other plugins can be added here
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'luochen1990/rainbow'

" End plugin installation
call plug#end()
" Enable syntax highlighting

syntax enable

" Enable true color support for modern terminals (optional)
if has('termguicolors')
    set termguicolors
endif

set t_Co=256

set guicursor=n-v-c-i:block



" Enable mouse support
set mouse=a

" Enable line numbers
set number

" Enable line wrapping
set wrap

" Enable search highlighting
set hlsearch

" Enable incremental search
set incsearch

" Show matching parentheses and brackets
set showmatch

" Automatically reload files when changed outside of Vim
set autoread

" Enable relative line numbers
set relativenumber

set cursorline

" Set tab width to 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab
" highlight LineNr guifg=#5f87af guibg=#1c1c1c ctermfg=cyan ctermbg=black
" highlight CursorLineNr guifg=#ffaf00 guibg=#1c1c1c ctermfg=yellow ctermbg=black

highlight Search ctermfg=white ctermbg=none guifg=white guibg=NONE

" Set cursorline background to #505050 (for GUI)
" Set visual highlight background to #505050 (for GUI)
highlight Visual ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE

" For terminal, you can set a different background color since transparent needs terminal support
highlight Normal ctermbg=NONE guibg=NONE

" Set a transparent background (works in supporting terminals)
highlight Normal guibg=NONE ctermbg=NONE
highlight NonText guibg=NONE ctermbg=NONE

" highlight CursorLine ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE

hi CursorLine term=bold cterm=bold guibg=NONE
" highlight CoursorLine guibg=NONE ctermbg=NONE

" highlight CursorLine guibg=NONE ctermbg=NONE guifg=NONE ctermfg=NONE
highlight LineNr guifg=#5f87af guibg=#5f87af ctermfg=cyan ctermbg=NONE
highlight Normal guibg=NONE ctermbg=NONE
highlight NonText guibg=NONE ctermbg=NONE

" set nocursorline
highlight LineNr guifg=NONE guibg=NONE ctermfg=cyan ctermbg=NONE
"highlight CursorLineNr guifg=#ffaf00 guibg=NONE ctermfg=yellow ctermbg=NONE
highlight CursorLineNr guifg=#ffaf00 guibg=#ffaf00 ctermfg=yellow ctermbg=NONE
highlight CursorLineNr guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
" Denne fjerner gråe linjen highlight

hi Normal guifg=grey guibg=black

colorscheme zfx
" Remove mode message highlight
highlight ModeMsg ctermbg=NONE guibg=NONE
" Highlight opening parentheses
highlight ParenthesisOpen guifg=Blue

" Highlight closing parentheses
highlight ParenthesisClose guifg=Red

" Highlight opening braces
highlight BraceOpen guifg=Green

" Highlight closing braces
highlight BraceClose guifg=Yellow

let g:rainbow_active = 1

" Set terminal-based Visual mode highlight to bold
highlight Visual cterm=bold




let g:rainbow_conf = {
\ 'guifgs': ['#FFD500', '#DA6FD5', '#169FFF'],  
\ 'ctermfgs': ['yellow', 'magenta', 'cyan'],   
\ 'guis': [''],
\ 'cterms': [''],
\ 'operators': '_,_',
\ 'parentheses': [
\   'start=/(/ end=/)/ fold',
\   'start=/\[/ end=/\]/ fold',
\   'start=/{/ end=/}/ fold'
\ ],
\ 'separately': {
\   '*': {},
\   'markdown': {
\     'parentheses_options': 'containedin=markdownCode contained'
\   },
\   'lisp': {
\     'guifgs': ['#FFD500', '#DA6FD5', '#169FFF', '#FFD500', '#DA6FD5', '#169FFF']
\   },
\   'haskell': {
\     'parentheses': [
\       'start=/(/ end=/)/ fold',
\       'start=/\[/ end=/\]/ fold',
\       'start=/\v\{\ze[^-]/ end=/}/ fold'
\     ]
\   },
\   'vim': {
\     'parentheses_options': 'containedin=vimFuncBody'
\   },
\   'perl': {
\     'syn_name_prefix': 'perlBlockFoldRainbow'
\   },
\   'stylus': {
\     'parentheses': [
\       'start=/{/ end=/}/ fold contains=@colorableGroup'
\     ]
\   },
\   'css': 0,
\   'nerdtree': 0
\ }
\ }

