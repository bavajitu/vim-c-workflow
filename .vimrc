set mouse=a

" Set leader key
let mapleader = " "

" enable syntax "
syntax on

set relativenumber

set laststatus=2

" enable line numbers "
set number

" highlight current line "
"set cursorline
":highlight Cursorline cterm=bold ctermbg=black

" enable highlight search pattern "
set incsearch

" enable smartcase search sensitivity "
set ignorecase
set smartcase

" Indentation using spaces "
" tabstop:	width of tab character
" softtabstop:	fine tunes the amount of whitespace to be added
" shiftwidth:	determines the amount of whitespace to add in normal mode
" expandtab:	when on use space instead of tab
" textwidth:	text wrap width
" autoindent:	autoindent in new line
set tabstop	=4
set softtabstop	=4
set shiftwidth	=4
set textwidth	=79
set expandtab
set autoindent

" show the matching part of pairs [] {} and () "
set showmatch

" remove trailing whitespace from Python and Fortran files "
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.f90 :%s/\s\+$//e
autocmd BufWritePre *.f95 :%s/\s\+$//e
autocmd BufWritePre *.for :%s/\s\+$//e

" enable color themes "
if !has('gui_running')
	set t_Co=256
endif
" enable true colors support "
set termguicolors
" Vim colorscheme "

let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#tab_nr_type = 1

"-------------------------------------------------------------"
"Bonus. " Find & Replace (if you use the ignorecase, smartcase these are mandatory) "
"            :%s/<find>/<replace>/g   "replace global (e.g. :%s/mass/grass/g)"
"            :%s/<find>/<replace>/gc  "replace global with confirmation"
"            :%s/<find>/<replace>/gi  "replace global case insensitive"
"            :%s/<find>/<replace>/gI  "replace global case sensitive"
"            :%s/<find>/<replace>/gIc "replace global case sensitive with confirmation"

"        " Vim (book)marks "
"            mn     "replace n with a word A-Z or number 0-9"
"            :'n     "go to mark n"
"            :`.     "go to the last change"
"            :marks  "show all declared marks"
"            :delm n "delete mark n"

"        " Delete range selection "
"            :<line_number>,<line_number>d "(e.g. :2,10d deletes lines 2-10)"

"        " LaTeX shortcuts "
"            nnoremap <F1> :! pdflatex %<CR><CR>
"            nnoremap <F2> :! bibtex $(echo % \| sed 's/.tex$//') & disown<CR><CR>
"            nnoremap <F3> :! evince $(echo % \| sed 's/tex$/pdf/') & disown<CR><CR>
"            nnoremap <F4> :! rm *.log *.aux *.out *.blg & disown<CR><CR>
"

" Enable auto-pairing of quotes
inoremap " ""<Left>
inoremap ' ''<Left>

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'lervag/vimtex'
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'lilydjwg/colorizer'
Plug 'vim-autoformat/vim-autoformat'
Plug 'vim-airline/vim-airline-themes'
Plug 'nordtheme/vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'ryanoasis/vim-devicons'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'jiangmiao/auto-pairs'
Plug 'joshdick/onedark.vim'

call plug#end()

"colorscheme catppuccin_macchiato
colorscheme onedark
hi Normal guibg=NONE ctermbg=NONE
"let g:airline#extensions#tabline#buffer_idx_type = 1
"let g:airline#extensions#tabline#max_count = 20 " Limit number of tabs displayed
let g:airline_theme = 'onedark'
" Vim Airline Tabline configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#tab_nr_type = 1


" Keymappings

" Increment/decrement
nnoremap + <C-a>
nnoremap - <C-x>

" Delete a word backwards
nnoremap dw vb_d

" Select all
nnoremap <C-a> gg<V-CR>G

" Jumplist
nnoremap <C-m> <C-i>

" New tab
nnoremap te :tabedit<CR>
nnoremap <tab> :tabnext<CR>
nnoremap <s-tab> :tabprev<CR>

" Split window
nnoremap ss :split<CR>
nnoremap sv :vsplit<CR>

" Move window
nnoremap sh <C-w>h
nnoremap sk <C-w>k
nnoremap sj <C-w>j
nnoremap sl <C-w>l

" Resize window
nnoremap <C-w><left> <C-w><
nnoremap <C-w><right> <C-w>>
nnoremap <C-w><up> <C-w>+
nnoremap <C-w><down> <C-w>-

" Diagnostics
nnoremap <C-j> :lua vim.diagnostic.goto_next()<CR>

" FZF keybinding
nnoremap <silent> <Space><Space> :FZF<CR>

" NerdTree Toggle keymapping
nnoremap <leader>n :NERDTreeToggle<CR>

"Pop-up command input
function! CommandPopup()
    let command = input('Command: ')
    execute 'normal! :'.command
endfunction

"Add keybind for popup command panel
nnoremap <silent> <Leader>p :Commands<CR>


" Build LaTeX files with this command
nnoremap <leader>bd :w<CR>:!pdflatex %<CR>:!zathura %:r.pdf &<CR><CR>

let g:vimtex_complete_enabled = 1  " Enable vimtex completion
let g:vimtex_complete_close_braces = 1  " Auto-complete closing braces

" KeyMappings for COC.nvim 
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

