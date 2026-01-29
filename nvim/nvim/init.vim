"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SAUL NVIM CONFIG
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" must be before plugins are loaded
" I use Coc for LSP
let g:ale_disable_lsp = 1

" python support needed for some plugins
let g:python3_host_prog = '/usr/bin/python3'
let g:clipboard = 'tmux'

" PLUGINS (vim plugged)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
" airline statusbar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" colorscheme
Plug 'tomasr/molokai'
call plug#end()

" GENERAL SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" read .zshrc and aliases
set shell=zsh
set number
set mouse=a
" hide the --INSERT-- and other status (since it is shown by airline)
set noshowmode
" Show special characters
set listchars=eol:¬,tab:>-,trail:~,extends:>,precedes:<
set list
" the encoding for special chars
set fileformat=unix
" auto-indent after enter
set autoindent
" the level of conceling of text, see :help conceallevel for more details
set conceallevel=2
" indent settings matches tab setting
set smartindent
" enable powerline fonts in airline
let g:airline_powerline_fonts = 1

" APPEARANCE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable true colors in terminal
set termguicolors
" sets theme
colorscheme molokai
" Since I am using termguicolors, I need to declare colors for gui not cterm!
" Disable background to use transparency in terminal
highlight Normal guibg=none
" hide background in concealed text and change its color
highlight Conceal guibg=none guifg=cyan

" SHORTCUTS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set the leader charachter to space
let mapleader =" "
" for tabs
nnoremap <C-h> :tabp<CR>
nnoremap <C-l> :tabn<CR>
nnoremap <Tab> :tabedit<Space>

" configure cross-program copy-paste
vnoremap <C-c> "+y
" cannot use C-v for paste since it is used for visual selection
noremap <C-p> "+P
" for removing search highlight by hitting ESC
nnoremap <esc> :noh<return><esc>
nnoremap <leader>t :!$TERMCMD -d "%:p:h"&<CR><CR>
