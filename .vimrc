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

" Ctrl + F to open search prompt
nnoremap <C-f> /

" Ctrl + F in insert mode to start search
inoremap <C-f> <Esc>/

" Use Ctrl + A to select all text
nnoremap <C-a> ggVG

" Use system clipboard for copy and paste
vnoremap <C-c> "+y        " Copy selected text to system clipboard
nnoremap <C-v> "+p        " Paste from system clipboard
inoremap <C-v> <C-O>"+p   " Paste from system clipboard in insert mode

" Map Ctrl + S to save the file
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a

" Move selected lines up with Alt+Shift+Up in visual mode
vmap <A-S-Up> :move '<-2<CR>gv
" Move selected lines down with Alt+Shift+Down in visual mode
vmap <A-S-Down> :move '>+1<CR>gv

set mouse=a

" Highlight all instances of the selected word in visual mode
vnoremap <silent> <leader>h :<C-u>execute 'match Search /\V' . escape(@", '/\')<CR>

hi Normal guifg=grey guibg=black

if &term == "builtin_gui"
    set background=dark
else
    set background=dark
endif

set guicursor=n-v-c-i:block

" highlight LineNr guifg=#5f87af guibg=#1c1c1c ctermfg=cyan ctermbg=black
" highlight CursorLineNr guifg=#ffaf00 guibg=#1c1c1c ctermfg=yellow ctermbg=black

highlight Search ctermfg=white ctermbg=none guifg=white guibg=NONE

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
"highlight CursorLineNr guifg=#ffaf00 guibg=NONE ctermfg=yellow ctermbg=NONE
highlight CursorLineNr guifg=#ffaf00 guibg=#ffaf00 ctermfg=yellow ctermbg=NONE
highlight LineNr guifg=#5f87af guibg=#5f87af ctermfg=cyan ctermbg=NONE
highlight Normal guibg=NONE ctermbg=NONE
highlight NonText guibg=NONE ctermbg=NONE

hi CursorLine term=bold cterm=bold guibg=NONE

highlight CoursorLine guibg=NONE ctermbg=NONE
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
