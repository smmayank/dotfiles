filetype on
syntax on
colorscheme Tomorrow-Night

" Show line numbers
set number

" Leader key maps
" s -> reload vimrc config
map <leader>s :source ~/.vimrc<CR>

" Enable file level indentations
filetype indent on

" Basic indentation
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent

" Highlight search
set hlsearch

" Clear search result with escape
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
