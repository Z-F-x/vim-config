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
vnoremap <C-c> "+y   
nnoremap <C-v> "+p
inoremap <C-v> <C-O>"+p  

" Map Ctrl + Shift + C to copy to clipboard
map <C-S-C> "+y

" Map Ctrl + Shift + V to paste from clipboard
map <C-S-V> "+p

" Move selected lines up with Ctrl+Alt+Up in visual mode
vmap <C-A-Up> :move '<-2<CR>gv

" Move selected lines down with Ctrl+Alt+Down in visual mode
vmap <C-A-Down> :move '>+1<CR>gv

" Move to the end of the current line with Shift + D
" nnoremap D $

" Move to the last line of the file with Meta + D
" nnoremap D G

" Move to the first column of the first line with Shift + E
nnoremap <S-E> gg0


" Shift + A: Move cursor to the beginning of the line -  In Visual Mode
vnoremap <S-A> <C-o>0

" Shift + S: Move cursor to the end of the line - in Visual Mode
vnoremap <S-S> <C-o>$

" Shift + A: Move cursor to the beginning of line - In Normal Mode
nnoremap <S-A> 0

" Shift + S: Move cursor to the end of the line - In Normal Mode
nnoremap <S-S> $

" Move half page up with Shift + D in Normal Mode
nnoremap <S-D> <C-U>


" Move half page up with Shift + D in Visual Mode
vnoremap <S-D> <C-o><C-U>

" In Normal Mode
" Alt + Left Arrow: Move the cursor to the beginning of the line
nnoremap <A-Left> 0

" Alt + Right Arrow: Move the cursor to the end of the line
nnoremap <A-Right> $

" Alt + Up Arrow: Move the cursor to the beginning of the first line (top of the file)
nnoremap <A-Up> gg

" Alt + Down Arrow: Move the cursor to the end of the last line (bottom of the file)
nnoremap <A-Down> G

" In Insert Mode
" Alt + Left Arrow: Temporarily switch to Normal mode (with Ctrl + o), then move cursor to the beginning of the line
inoremap <A-Left> <C-o>0

" Alt + Right Arrow: Temporarily switch to Normal mode (with Ctrl + o), then move cursor to the end of the line
inoremap <A-Right> <C-o>$

" Alt + Up Arrow: Temporarily switch to Normal mode (with Ctrl + o), then move cursor to the beginning of the first line
inoremap <A-Up> <C-o>gg

" Alt + Down Arrow: Temporarily switch to Normal mode (with Ctrl + o), then move cursor to the end of the last line
inoremap <A-Down> <C-o>G

" In Visual Mode
" Alt + Left Arrow: Temporarily switch to Normal mode (with Ctrl + o), then move cursor to the beginning of the line
vnoremap <A-Left> <C-o>0

" Alt + Right Arrow: Temporarily switch to Normal mode (with Ctrl + o), then move cursor to the end of the line
vnoremap <A-Right> <C-o>$

" Alt + Up Arrow: Temporarily switch to Normal mode (with Ctrl + o), then move cursor to the beginning of the first line
vnoremap <A-Up> <C-o>gg

" Alt + Down Arrow: Temporarily switch to Normal mode (with Ctrl + o), then move cursor to the end of the last line
vnoremap <A-Down> <C-o>G

" In Normal Mode
" Alt + Shift + Right Arrow: Move the cursor to the middle of the file
nnoremap <A-S-Right> :execute "normal! " . (line('$') / 2) . "gg"<CR>

" In Insert Mode
" Alt + Shift + Right Arrow: Temporarily switch to Normal mode (with Ctrl + o), then move to the middle of the file
inoremap <A-S-Right> <C-o>:execute "normal! " . (line('$') / 2) . "gg"<CR>

" In Visual Mode
" Alt + Shift + Right Arrow: Temporarily switch to Normal mode (with Ctrl + o), then move to the middle of the file
vnoremap <A-S-Right> <C-o>:execute "normal! " . (line('$') / 2) . "gg"<CR>

" In Normal Mode
" Alt + Shift + Up Arrow: Move the cursor to the middle of the first half of the file
nnoremap <A-S-Up> :execute "normal! " . (line('$') / 4) . "gg"<CR>

" Alt + Shift + Down Arrow: Move the cursor to the middle of the bottom half of the file
nnoremap <A-S-Down> :execute "normal! " . (line('$') * 3 / 4) . "gg"<CR>

" In Insert Mode
" Alt + Shift + Up Arrow: Temporarily switch to Normal mode (with Ctrl + o), then move to the middle of the first half of the file
inoremap <A-S-Up> <C-o>:execute "normal! " . (line('$') / 4) . "gg"<CR>

" Alt + Shift + Down Arrow: Temporarily switch to Normal mode (with Ctrl + o), then move to the middle of the bottom half of the file
inoremap <A-S-Down> <C-o>:execute "normal! " . (line('$') * 3 / 4) . "gg"<CR>

" In Visual Mode
" Alt + Shift + Up Arrow: Temporarily switch to Normal mode (with Ctrl + o), then move to the middle of the first half of the file
vnoremap <A-S-Up> <C-o>:execute "normal! " . (line('$') / 4) . "gg"<CR>

" Alt + Shift + Down Arrow: Temporarily switch to Normal mode (with Ctrl + o), then move to the middle of the bottom half of the file
vnoremap <A-S-Down> <C-o>:execute "normal! " . (line('$') * 3 / 4) . "gg"<CR>

" Initialize a global variable to track the number of key presses
let g:cursor_move_cycle = 0

" Function to move the cursor as per the alternating pattern
function! MoveCursor()
  " Get the current line
  let line = getline('.')
  let line_length = len(line)

  " Calculate the step size (1/7th of the line length)
  let step = line_length / 7
  let middle_pos = line_length / 2  " Zero-based middle of the line

  " Get the current cursor position (column)
  let current_col = col('.') - 1  " Zero-based index of cursor column

  " If the cursor is not in the middle, move it there first
  if current_col != middle_pos
    call cursor(line('.'), middle_pos + 1) " Move cursor to the middle (1-based index)
    let g:cursor_move_cycle = 1  " Start the alternating cycle from here
    return
  endif

  " Alternate movement pattern when the cursor is in the middle
  let cycle_pos = g:cursor_move_cycle % 7

  " Determine the direction based on the step in the cycle
  if cycle_pos == 0
    let new_pos = middle_pos - step  " 1/7 to the left from the middle
  elseif cycle_pos == 1
    let new_pos = middle_pos + step  " 1/7 to the right from the middle
  elseif cycle_pos == 2
    let new_pos = middle_pos - 2 * step  " 2/7 to the left from the middle
  elseif cycle_pos == 3
    let new_pos = middle_pos + 2 * step  " 2/7 to the right from the middle
  elseif cycle_pos == 4
    let new_pos = 1  " Move to the start of the line
  elseif cycle_pos == 5
    let new_pos = line_length  " Move to the end of the line
  elseif cycle_pos == 6
    let new_pos = middle_pos  " Reset to the middle
  endif

  " Set the cursor to the new position (1-based index)
  call cursor(line('.'), new_pos + 1)  " Adjust for 1-based index

  " Increment the cycle counter
  let g:cursor_move_cycle += 1
endfunction

" Key mapping for Ctrl + Alt + Up Arrow to move the cursor
" Make sure your terminal can recognize this combination
nnoremap <C-A-Up> :call MoveCursor()<CR>

" ***********************************************************************************************************************
" MoveInSevenSteps funcion: Alternate up and down in 1/7th increments, will cycle repeat
" ============================
" TODO: 
" ============================
" Idé: Alt + Shift + Arrow Up og Arrow Down cycler i 1/7 increments opp og ned.   
" Idé hotkey for å flytte musepekeren på current line til midten og dele opp i
" 7 på samme måte som heri
" Idé: Hotkey for å flytte mouse cursor i increments of 7 diagonalt across the
" screen oppe til venstre til nede høyre, oppe høyre til nede venstre og
" omvendt på begge.
"
" Initialize step counter globally
let g:step = 0

" Function to calculate and move the cursor
function! MoveInSevenSteps()
    let total_lines = line('$')
    let middle = total_lines / 2
    let step_size = total_lines / 7
    let target_line = 0

    " Alternate between moving upwards and downwards in 1/7th steps
    if g:step == 4
        " Step 5: Move to the top of the file (line 1)
        let target_line = 1
    elseif g:step == 5
        " Step 6: Move to the end of the file (last line)
        let target_line = total_lines
    elseif g:step == 6
        " Step 7: Move directly to the middle (line 581 for 1162 lines)
        let target_line = middle
    elseif g:step % 2 == 0
        " Move upwards
        let target_line = middle - (step_size * ((g:step / 2) + 1))
    else
        " Move downwards
        let target_line = middle + (step_size * ((g:step / 2) + 1))
    endif

    " Ensure the target line is within valid range
    if target_line < 1
        let target_line = 1
    elseif target_line > total_lines
        let target_line = total_lines
    endif

    " Move to the target line
    execute "normal! " . target_line . "G"

    " Increment step
    let g:step += 1

    " Reset step counter after 7 steps (i.e., after completing one full cycle)
    if g:step >= 7
        let g:step = 0
    endif
endfunction

" Map Alt + Shift + Left Arrow to call MoveInSevenSteps
nnoremap <A-S-Left> :call MoveInSevenSteps()<CR>

" Insert Mode mappings
inoremap <A-S-Left> <C-o>:call MoveInSevenSteps()<CR>

" Visual Mode mappings
vnoremap <A-S-Left> <C-o>:call MoveInSevenSteps()<CR>


" ***********************************************************************************************************************

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
Plug 'terryma/vim-multiple-cursors'


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

set laststatus=2 " Always show the status line
" set statusline=%=%f\ %l\ —\ Custom\ Text\ — %c\ %m%r%h\ %p%%\ %P%=
" set statusline=%=%f\ │\ %l\ │\ %c\ %m%r%h\ │\ %p%%\ │\ %P%=

" Status line to the right
" set statusline=%=%f\ │\ %l\ │\ %c\ %m%r%h\ │\ %p%%\ │\ %P\ │\ %L

" Status line centered
" set statusline=%=%f\ │\ %l\ │\ %c\ %m%r%h\ │\ %p%%\ │\ %P\ │\ %L%= 


" Function to calculate which section of 1/7th of the file you're in
function! SectionOfSeven()
  " Get the total number of lines in the file
  let total_lines = line('$')
  
  " Divide the file into 7 sections, and calculate the section for the current line
  let section_size = total_lines / 7
  let current_line = line('.')

  " Determine the section (1 to 7) based on the current line number
  let section = (current_line - 1) / section_size + 1

  " Return the section number as a string
  return string(section)
endfunction

" Function to calculate the total number of characters in the file
function! TotalChars()
  " Join all lines and get the length (total number of characters)
  let total_chars = strlen(join(getline(1, '$')))
  return total_chars
endfunction

" Function to get the file size in bits, bytes, and MB with the desired format
function! FileSizeFormatted()
  " Get the file size in bytes
  let file_size = getfsize(expand('%'))

  " Calculate the file size in bits, bytes, and MB
  let file_size_bits = file_size * 8
  let file_size_bytes = file_size
  let file_size_mb = file_size / 1048576.0

  " Format the output
  let bits_str = printf('%05d Bits', file_size_bits)
  let bytes_str = printf('%05d Bytes', file_size_bytes)
  let mb_str = printf('%.4fMB', file_size_mb)

  " Return the formatted file size string
  return bits_str . ' / ' . bytes_str . ' / ' . mb_str
endfunction

" Function to calculate the size of the unsaved changes (differences)
function! UnsavedChangesSize()
  " Get the current buffer content
  let buffer_lines = getline(1, '$')

  " Get the saved file content (before any changes)
  let saved_lines = readfile(expand('%'))

  " Find the lines that have changed by comparing current buffer lines with saved file lines
  let unsaved_changes = []

  " Compare the two sets of lines
  for i in range(0, min([len(buffer_lines), len(saved_lines)]) - 1)
    if buffer_lines[i] != saved_lines[i]
      call add(unsaved_changes, buffer_lines[i])
    endif
  endfor

  " Add any lines in the buffer that have been added but not yet saved
  if len(buffer_lines) > len(saved_lines)
    call extend(unsaved_changes, buffer_lines[len(saved_lines):])
  endif

  " Calculate the unsaved changes size (in bytes and bits)
  let unsaved_text = join(unsaved_changes)
  let unsaved_size_bytes = strlen(unsaved_text)
  let unsaved_size_bits = unsaved_size_bytes * 8

  " Format the output
  let unsaved_bits_str = printf('%05d Bits', unsaved_size_bits)
  let unsaved_bytes_str = printf('%05d Bytes', unsaved_size_bytes)

  return unsaved_bits_str . ' / ' . unsaved_bytes_str
endfunction

" Function to calculate the total columns (characters) in the current line
function! TotalColumns()
  " Get the total number of characters in the current line
  return len(getline('.'))
endfunction

" Function to update the statusline dynamically
function! UpdateStatusline()
  " Redraw the statusline to show all the requested information
" set statusline=%=%c\/%{TotalColumns()}\ │\ %f\ │\ %l/%L\ │\ %{SectionOfSeven()}/7\ │\ Chars:\ %{TotalChars()}\ │\ 🗎\ %{FileSizeFormatted()}\ │\ 🖪\ %{UnsavedChangesSize()}\ %m%r%h\ │\ %p%%%= 

  set statusline=%\=%c\/%{TotalColumns()}\ •\ %f\ •\ %l/%L\ •\ %{SectionOfSeven()}/7\ •\ Chars:\ %{TotalChars()}\ •\ 🗎\ %{FileSizeFormatted()}\ •\ 🖪\ %{UnsavedChangesSize()}\ %m%r%h\ •\ %p%%\%= 


set laststatus=2  " Always display the status line
set cmdheight=1   " Make the command line area higher, creating a gap
" set statusline=%•\ %\=%c\/%{TotalColumns()}\ •\ %f\ •\ %l/%L\ •\ %{SectionOfSeven()}/7\ •\ Chars:\ %{TotalChars()}\ •\ 🗎\ %{FileSizeFormatted()}\ •\ 🖪\ %{UnsavedChangesSize()}\ %m%r%h\ •\ %p%%\ 


 " set statusline=%=%c/%{TotalColumns()} %f %l/%L %{SectionOfSeven()}/7 Chars: %{TotalChars()} 🗎 %{FileSizeFormatted()} 🖪 %{UnsavedChangesSize()} %m%r%h %p%%=

  " Trigger a redraw of the statusline
  redrawstatus
endfunction

" Set up autocommands to update the statusline in real time
augroup UpdateStatuslineGroup
  autocmd!
  " Update statusline whenever the cursor moves or the file changes
  autocmd CursorMoved,TextChanged,TextChangedI * call UpdateStatusline()
augroup END




" set statusline=%=%f\ %l\ —\ Custom\ Text\ — %c\ %m%r%h\ %p%%\ %P%=
"set statusline=%f\ %l\|%c\ [%y]\ %p%%\ %P\ —\ Custom\ Text\ —

" Set Status Line text color to gray and background color to transparent
highlight StatusLine ctermfg=8 guifg=#505050 ctermbg=NONE guibg=NONE

" Set Statusline New Character Background to transparent
highlight StatusLineNC ctermbg=NONE guibg=NONE

" Setter full tittel fra root top left i terminalvinduet
set title
set titlestring=%F
