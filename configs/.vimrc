filetype on
syntax on
colorscheme Tomorrow-Night

" Show line numbers
set number

" Leader key maps use these keys after leader "\"
" s       -> reload vimrc config
map <leader>s :source ~/.vimrc<CR>
" Enter   -> highlight search
nnoremap <silent> <leader><CR> :set hlsearch<CR>
" Escape  -> clear highlighting
nnoremap <silent> <leader><Esc> :set nohlsearch<Bar>:echo<CR>

" Enable file level indentations
filetype indent on

" Basic indentation
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent

"Highlingt matching mapenthesis
set showmatch

" Enable pathogen
execute pathogen#infect()
