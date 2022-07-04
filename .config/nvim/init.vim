call plug#begin('~/.vim/plugged')

Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'bryanmylee/vim-colorscheme-icons'

Plug 'reedes/vim-pencil'

Plug 'evanleck/vim-svelte', {'branch': 'main'}

Plug 'arcticicestudio/nord-vim'

Plug 'itchyny/lightline.vim'

Plug 'ellisonleao/glow.nvim'

Plug 'tpope/vim-fugitive'

Plug 'norcalli/nvim-colorizer.lua'

Plug 'nvim-lua/plenary.nvim'

Plug 'nvim-telescope/telescope.nvim'

Plug 'kyazdani42/nvim-web-devicons'

Plug 'romgrk/barbar.nvim'

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

" show matching brackets
set showmatch

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

" vim nord theme
set termguicolors
let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
set background=dark
colorscheme nord
hi normal guibg=000000

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
autocmd BufReadPre * CocStart
autocmd BufNewFile * CocStart
autocmd BufReadPre * CocEnable
autocmd BufNewFile * CocEnable
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" colorizer 
lua require'colorizer'.setup()

nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
nnoremap <Space>ff <cmd>:Telescope find_files<cr>
nnoremap <Space>fg <cmd>:Telescope live_grep<cr>
nnoremap <Space>fb <cmd>:Telescope buffers<cr>
nnoremap <Space>fh <cmd>:Telescope help_tags<cr>

" tabs and keybindings
nnoremap <C-Left> : tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-j> :tabprevious<CR>
nnoremap <C-k> :tabnext<CR>
nnoremap <C-t> :tabnew<CR>

" spellchecker 
set spelllang=en_us
map <Space>s <cmd>:setlocal spell<cr>

" autoindent
map <Space>a <cmd>:setlocal autoindent<cr>
map <Space>A <cmd>:setlocal noautoindent<cr>

" clipboard settings
set clipboard+=unnamedplus

" run programs
" c++
nnoremap <M-c> :!g++ % -Wall -g -o %:r && ./%:r<CR>
" go
nnoremap <M-g> :!go run % <CR>

" set line number
set number

set mouse+=a

" telescope fuzzy finder configs
lua << EOF
require('telescope').setup{ defaults = { file_ignore_patterns = {"node_modules"} } } 
