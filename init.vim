" basic syntax highlighting
syntax on

" smaller indentation
set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4

"relative line numbering
set relativenumber

" encoding
set encoding=utf-8

" quit when pressing q on command mode
map q :quit<CR>

" no need to press return to search
set incsearch

" better help menu
set wildmenu

" better bar with file info
set laststatus=2

" title for dwm bar
set title

" better forcing
set confirm

" save with ctrl + s
:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>

call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'alvan/vim-closetag'
call plug#end()

" coc extensions
let g:coc_global_extensions = ['coc-snippets', 'coc-pairs', 'coc-html', 'coc-explorer', 'coc-tsserver', 'coc-rust-analyzer', 'coc-json', 'coc-go', 'coc-clangd']

" coc config
source $HOME/.config/nvim/plug-config/coc.vim	

" theme
autocmd vimenter * ++nested colorscheme gruvbox
set bg=dark

" explorer
:nmap <space>e <Cmd>CocCommand explorer<CR>

" getting coc-pairs and vim-closetag to work with each other
autocmd FileType html let b:coc_pairs_disabled = ['<']
