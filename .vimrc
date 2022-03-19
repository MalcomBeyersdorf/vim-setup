" -----------------------------------------------------------------------------
" Basic Settings
"   Research any of these by running :help <setting>
" ----------------------------------------------------------------------------- 
syntax on
set nocompatible
filetype off
set encoding=utf-8
set guicursor=
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=8 softtabstop=8
set shiftwidth=8
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set nobackup
set noswapfile
set incsearch
set scrolloff=35
set noshowmode
set timeout timeoutlen=1000 ttimeoutlen=100
set backspace=indent,eol,start
set splitright

set laststatus=2
set t_Co=256

let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'

call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'easymotion/vim-easymotion'
Plug 'mattn/emmet-vim'
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-ragtag'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdcommenter'
Plug 'APZelos/blamer.nvim'
Plug 'Yggdroot/indentLine'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'dart-lang/dart-vim-plugin'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
call plug#end()

colorscheme gruvbox

" Desahibilita los linters para que coc-go se haga cargo
let g:go_diagnostics_enabled = 0
let g:go_metalinter_enabled = []

" don't jump to errors after metalinter is invoked
let g:go_jump_to_error = 0

" run go imports on file save
let g:go_fmt_command = "goimports"

" automatically highlight variable your cursor is on
let g:go_auto_sameids = 0
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

"Vim dart configs
let g:dart_style_guide = 2
let g:dart_format_on_save = 1
"
"Airline configs
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#close_symbol = '×'
let g:airline#extensions#tabline#show_close_button = 0
let g:airline_theme='minimalist'

"let g:NERDTreeWinPos = "right"

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
let mapleader=" "

let g:UltiSnipsExpandTrigger = '<C-w>'
filetype plugin indent on
let g:UltiSnipsSnippetDirectories=["UltiSnips", $HOME.'/.config/nvim/plugged/vim-snippets/UltiSnips/']
let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/plugged/vim-snippets/UltiSnips/', 'UltiSnips']


" Git blame config
let g:blamer_show_in_insert_modes = 0
let g:blamer_prefix = ' > '

" Git maps
nnoremap <Leader>gc :GCheckout<CR>
nmap <Leader>lk :diffget //3<CR>
nmap <Leader>as :diffget //2<CR>
nmap <Leader>gs :G<CR>

" File manager
nmap <C-p> :Files<CR>
let g:fzf_actions = { 'ctrl-e': 'edit' }

" Basic maps
nnoremap <Leader>q :q<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>nt :NERDTreeToggle<CR>
nmap <Leader>s <Plug>(easymotion-s2)
nnoremap <Leader>t :vert term<CR>

" Tabs nerdtree
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-n> :tabnew<CR>
map <C-j> :execute "tabmove" tabpagenr() - 2 <CR>
map <C-k> :execute "tabmove" tabpagenr() + 1 <CR>

"  Bubble single lines
nmap <m-k> :m .-2<CR>
nmap <m-j> :m  .+1<CR>

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Bubble multiple lines
vnoremap <silent> <C-k>  @='"zxk"zP`[V`]'<CR>
vnoremap <silent> <C-j>  @='"zx"zp`[V`]'<CR>'`]]`'"
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" GoTo macro.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap H gT
nnoremap L gt

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols harcodeados
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols harcodeados
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'

" old vim-powerline symbols
"let g:airline_left_sep = '⮀'
"let g:airline_left_alt_sep = '⮁'
"let g:airline_right_sep = '⮂'
"let g:airline_right_alt_sep = '⮃'
"let g:airline_symbols.branch = '⭠'
"let g:airline_symbols.readonly = '⭤'
"let g:airline_symbols.linenr = '⭡'

" Cambia el cursor a una linea cuando se esta en modo insertar o a modo bloque
" cuando en cualquier otro modo
"
" NOTE: En iTerm2 ir a preferences / profile / colors y desabilitar Smart Box Cursor.
"
" Valores de referencia:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" shortcut de print / console.log
" Console log en modo insert; pone el focus dentro del parentesis 
imap cll print();<Esc><S-f>(a
autocmd FileType go imap <buffer> cll fmt.Println()<Esc><S-f>(a
autocmd FileType javascript imap <buffer> cll console.log();<Esc><S-f>(a

" Console log del modo visual de bloque
vmap cll yocll<Esc>p

" Console log del modo visual en la siguiente linea, pone la variable en la
" que estas parado dentro del parentesis 
nmap cll yiwocll<Esc>p

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Adaptacion de ctrl C y ctrl v para mover de un tab al otro
xmap <leader>c  "*y
nmap <leader>v  "*p

" Diferentes puntos de corte para el comando U, asi no borra todo 
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Mover lineas 
vnoremap J :m '>+1<CR>gv==gv
vnoremap K :m '>-2<CR>gv==gv
inoremap <C-j> <esc>:m +1<CR>==
inoremap <C-k> <esc>:m -2<CR>==
nnoremap <leader>j :m +1<CR>==
nnoremap <leader>k :m -2<CR>==
