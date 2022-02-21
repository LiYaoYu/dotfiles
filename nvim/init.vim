" TODO:
" install fzf, the_silver_searcher, ripgrep
"
" vimdiff color
" search highlight configuration
" neovim LSP

call plug#begin()

" files/codes fuzzy exploring
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()


" change the comfirmation color
set bg=dark

" set encoding
set encoding=utf-8

" remain indent
set ai

" need confirmation before exit
set confirm

" do not change lines
set nowrap

" enable mouse in vim
set mouse=a

" enable cursor line config
se cursorline

" line number
set nu

" enable line number with colors
hi LineNr cterm=bold ctermfg=DarkGrey
hi CursorLineNR cterm=bold ctermfg=Green

" highlight current cursor line
hi CursorLine cterm=none ctermbg=234

" set 110 characters reminder
let &colorcolumn=join(range(111,999),",")
hi ColorColumn ctermbg=232

" brackets complement
imap {<CR> {<CR>}<Esc>ko<Tab>

" shortcuts for navigation between splited windows
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>
nmap <C-H> <C-W><C-H>

" resize windows
nmap , <C-W><
nmap . <C-W>>

" new tab
nmap T :tabe<CR>

" roll the tab
nmap - gT
nmap = gt

" vertical split current file
nmap <F2> :vsplit %:p<CR>

" search and replace words
nmap <F3> "zyiw:exe " Ag ".@z.""<CR>
nmap <F4> :cdo %s///gc <Left><Left><Left><Left><Left>

" plugin shortcut commands
nmap <F5> <Esc>:call RgExtension()<CR>
nmap <F6> :Files<CR>
nmap <F7> :NERDTree<CR>


" settings for status line
set statusline=
set statusline+=%2*\ %<%F\                                " File+path
set statusline+=%3*\ %=\ %{''.(&fenc!=''?&fenc:&enc).''}\ " Encoding
set statusline+=%6*\ %5l,%3c\                             " RowColnumber
set statusline+=%0*\ \ %m%r%w\ %P\ \                      " File Status Top/Bot
hi User2 ctermfg=15  ctermbg=237
hi User3 ctermfg=15  ctermbg=237
hi User6 ctermfg=0  ctermbg=32
set laststatus=2


" function definitions for calls above
fun! RgExtension()
  let target = input(":Rg ")

  exec "normal mX"
  exec "Rg ". target
  exec "normal mY"
endfun
