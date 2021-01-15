"===============================================================================
"			Basic Setings
"===============================================================================
set number
set relativenumber
syntax on
set showmode
set showcmd
set encoding=utf-8
set t_Co=256
filetype indent on
set autoindent
set shiftwidth=4
set ts=4
set spell spelllang=en_us
set nobackup
set noswapfile
set undofile
set visualbell
set noerrorbells
set cursorline
set cursorcolumn

let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode 


" split the screen
map sj :set splitbelow<CR>:split<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sl :set splitright<CR>:vsplit<CR>
" Test

" switch state to NORMAL
imap jj <ESC>


" quit and write quit
map q :q<CR>
map wq :wq<CR>
map ; A;<ESC>


map <Tab> I<Tab><Esc>
map ` ~



"===============================================================================
" 			Vim Plugs
"===============================================================================
call plug#begin('~/plugged')
    "the colorschemes
    Plug 'theniceboy/vim-deus'
    Plug 'kaicataldo/material.vim', {'branch': 'main'}
    Plug 'itchyny/lightline.vim'
    Plug 'luochen1990/rainbow'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'


    "auto completion
    Plug 'jiangmiao/auto-pairs'

    " Others
    Plug 'Yggdroot/indentLine'
    " Markdown
    " Plug 'iamcco/markdown-preview.nvim', {'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug']}
	Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app && yarn install' }
	Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }


call plug#end()
"================================================================================


"================================================================================
"			Markdown PreView Settings                                
"================================================================================

let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = 'chromium'
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ }

let g:mkdp_markdown_css = '~/plugged/mystyle1.css'
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'
source ~/.config/nvim/snippits.vim
"================================================================================


"================================================================================
"			Vim-table-mode Settings
"================================================================================

function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'
"================================================================================


"================================================================================
" Vim-Airline Settings
"================================================================================
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme = 'desertink'  " Setting theme
let g:airline#extensions#keymap#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
       \ '0': '0 ',
       \ '1': '1 ',
       \ '2': '2 ',
       \ '3': '3 ',
       \ '4': '4 ',
       \ '5': '5 ',
       \ '6': '6 ',
       \ '7': '7 ',
       \ '8': '8 ',
       \ '9': '9 '
       \}

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

nmap <leader>- <Plug>AirlineSelectPrevTab

nmap <leader>+ <Plug>AirlineSelectNextTab

nmap <leader>q :bp<cr>:bd #<cr>

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = "CL" " current line
let g:airline_symbols.whitespace = '|'
let g:airline_symbols.maxlinenr = 'Ml'
let g:airline_symbols.branch = 'BR'
let g:airline_symbols.readonly = "RO"
let g:airline_symbols.dirty = "DT"
let g:airline_symbols.crypt = "CR" 
"===============================================================================


"===============================================================================
"			Quickly Run
"===============================================================================

map <F5> :call CompileRunSource()<CR>

func! CompileRunSource()
    exec "w"
    if &filetype == 'c'
	  exec "!gcc % -o %<"
	  exec "!time ./%<"
    elseif &filetype == 'cpp'
  	  exec "!g++ % -o %<"
	  exec "!time ./%<"
    elseif &filetype == 'python'
	  silent! exec "!clear"
	  exec '!time python % '
    elseif &filetype == 'sh'
	  :!time bash %
    elseif &filetype == 'markdown'
      exec 'MarkdownPreview'
    elseif &filetype == 'java'
	  exec "!javac %"
	  exec "!time java %<"
    endif

endfunc
"===============================================================================


"===============================================================================
" set colorschemes
" colorscheme material
" colorscheme nord
color deus
