"syntax on
"colorscheme onedark
"colorscheme codedark

" Transparent background configuration
"if has("termguicolors")
 "   set termguicolors
 "   highlight Normal guibg=NONE
 "   highlight NonText guibg=NONE
"else
"    highlight Normal ctermbg=NONE
"    highlight NonText ctermbg=NONE
"endif
" Begin plugin installation
" Set search highlight color to #505050


set guicursor=n-v-c-i:block

" highlight LineNr guifg=#5f87af guibg=#1c1c1c ctermfg=cyan ctermbg=black
" highlight CursorLineNr guifg=#ffaf00 guibg=#1c1c1c ctermfg=yellow ctermbg=black

highlight Search ctermfg=white ctermbg=none guifg=NONE guibg=NONE

" Set cursorline background to #505050 (for GUI)
highlight CursorLine ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE

" Set visual highlight background to #505050 (for GUI)
highlight Visual ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE

" For terminal, you can set a different background color since transparent needs terminal support
highlight Normal ctermbg=NONE guibg=NONE

" For transparent background (GUI mode only)
set background=dark   " or 'light' depending on your theme

call plug#begin('~/.vim/plugged')
" Add the vim-code-dark plugin
"Plug 'tomasiser/vim-code-dark'

" Other plugins can be added here
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'

" End plugin installation
call plug#end()

" Set the colorscheme to Code Dark


" Enable line numbers
set number

" Enable line wrapping
set wrap

" Enable syntax highlighting
syntax enable



" Enable true color support for modern terminals (optional)
if has('termguicolors')
    set termguicolors
endif

" Set a transparent background (works in supporting terminals)
highlight Normal guibg=NONE ctermbg=NONE
highlight NonText guibg=NONE ctermbg=NONE

" Enable mouse support
set mouse=a

" Enable line numbers
set number

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


highlight CursorLine guibg=NONE ctermbg=NONE guifg=NONE ctermfg=NONE
highlight CursorLineNr guifg=#ffaf00 guibg=NONE ctermfg=yellow ctermbg=NONE
highlight LineNr guifg=#5f87af guibg=NONE ctermfg=cyan ctermbg=NONE
highlight Normal guibg=NONE ctermbg=NONE
highlight NonText guibg=NONE ctermbg=NONE

 hi CursorLine term=bold cterm=bold guibg=NONE

 highlight oursorLine guibg=NONE ctermbg=NONE
 " Denne fjerner gråe linjen highlight
" set nocursorline
 highlight LineNr guifg=NONE guibg=NONE ctermfg=cyan ctermbg=NONE
 highlight CursorLineNr guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE

 set cursorline


" Set tab width to 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab
colorscheme codedark
