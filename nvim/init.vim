call plug#begin('~/.vim/plugged')

Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

Plug 'ryanoasis/vim-devicons'

Plug 'bryanmylee/vim-colorscheme-icons'

Plug 'reedes/vim-pencil'

Plug 'evanleck/vim-svelte', {'branch': 'main'}

Plug 'navarasu/onedark.nvim'

Plug 'itchyny/lightline.vim'

Plug 'ellisonleao/glow.nvim'

Plug 'tpope/vim-fugitive'

Plug 'norcalli/nvim-colorizer.lua'

Plug 'glepnir/dashboard-nvim'

Plug 'nvim-lua/plenary.nvim'

Plug 'nvim-telescope/telescope.nvim'

call plug#end()

" shortcuts
" -----------------------------------------------------------------

" ctrl + d to start CHADtree
nnoremap <C-d> <cmd>CHADopen<cr>

" open new tab
nnoremap <C-t> :tabedit<CR>

" open interactive terminal 
nnoremap <S-t> :terminal<CR>

" open Glow Markdown Preview
noremap <leader> :Glow<CR>

" Configuring the Vertical Split Borders
highlight VertSplit cterm=NONE

" auto close brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" typing configs
" -----------------------------------------------------------------

" set line numbers
set number

" indents
" auto indent
set ai

" smart indent
set si

" On pressing tab, insert 2 spaces
set expandtab

" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2

" when indenting with '>', use 2 spaces width
set shiftwidth=2

" modifying cursorline 
set cursorline
hi CursorLine term=bold cterm=bold ctermbg=0xff79c6

" vim svelte plugins and setups
let g:svelte_preprocessors = ['typescript']

" auto soft pencil
au BufRead,BufNewFile * :SoftPencil

" vim onedark theme
let g:onedark_style = 'darker'
colorscheme onedark

" lightline config
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ 'active': {
      \   'left': [['mode', 'paste'], ['gitbranch', 'readonly', 'filename', 'modified']]
      \ },
      \ 'component_function': { 
      \   'gitbranch': 'FugitiveHead' 
      \ }
      \ }

" autocomplete for coc
autocmd BufReadPre * CocEnable
autocmd BufNewFile * CocEnable
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" colorizer 
lua require'colorizer'.setup()

" dashboard configs
let g:mapleader="\<Space>"
let g:dashboard_default_executive = 'telescope'
let g:dashboard_custom_header = [
\ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
\ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
\ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
\ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
\ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
\ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
\]
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
nnoremap <silent> <Leader>cn :DashboardNewFile<CR>

" telescope fuzzy finder configs
lua << EOF
require('telescope').setup{ defaults = { file_ignore_patterns = {"node_modules"} } } 
