-- basic syntax highlighting
vim.cmd('syntax on')

-- required by some plugins
vim.cmd('filetype plugin indent on')

-- smaller indentation
vim.o.autoindent = true
vim.o.expandtab = false
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- relative line numbering
vim.wo.relativenumber = true

-- encoding
vim.o.encoding = 'utf-8'

-- quit when pressing q on command mode
vim.api.nvim_set_keymap('n', 'q', ':quit<CR>', { noremap = true })

-- no need to press return to search
vim.o.incsearch = true

-- better help menu
vim.o.wildmenu = true

-- better bar with file info
vim.o.laststatus = 2

-- title for dwm bar
vim.o.title = true

-- better forcing
vim.o.confirm = true

-- save with ctrl + s
vim.api.nvim_set_keymap('n', '<c-s>', ':w<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<c-s>', '<Esc>:w<CR>', { noremap = true })

-- terminal shortcut
vim.api.nvim_set_keymap('n', '<c-t>', ':vert term<CR>', { noremap = true })

-- tabbing visual selection
vim.api.nvim_set_keymap('v', '<Tab>', '>gv', { noremap = true })
vim.api.nvim_set_keymap('v', '<S-Tab>', '<gv', { noremap = true })

-- clipboard copy has xclip as dependency
vim.o.clipboard = 'unnamedplus'

-- check flake8 on python write
vim.api.nvim_command('autocmd BufWritePost *.py call flake8#Flake8()')

-- python source
vim.g.python3_host_prog = '/usr/bin/python3'

-- Packer bootstrap
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])
if not packer_exists then
    local packer_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    vim.fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', packer_path })
    vim.cmd([[packadd packer.nvim]])
end

require('packer').startup(function()
  use 'neoclide/coc.nvim'
  use 'morhetz/gruvbox'
  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install'}
  use 'alvan/vim-closetag'
  use 'lervag/vimtex'
  use 'mattn/emmet-vim'
  use 'fatih/vim-go'
  use 'rust-lang/rust.vim'
  use 'amadeus/vim-css'
  use 'maxmellon/vim-jsx-pretty'
  use 'nvie/vim-flake8'
  use 'pangloss/vim-javascript'
  use {'evanleck/vim-svelte', branch = 'main'}
  use 'nvim-lualine/lualine.nvim'
  use 'ryanoasis/vim-devicons'
  use 'davidhalter/jedi-vim'
  use 'wlangstroth/vim-racket'
  use 'tpope/vim-commentary'
  use 'othree/html5.vim'
  use 'rhysd/vim-clang-format'
  use 'preservim/nerdtree'
  use 'sainnhe/gruvbox-material'
  use 'sheerun/vim-polyglot'
  use 'psf/black'
  use 'yaegassy/coc-tailwindcss3'
  use 'neovim/nvim-lspconfig'
end)

-- coc extensions
vim.g.coc_global_extensions = {
  'coc-snippets',
  'coc-pairs',
  'coc-html',
  'coc-tsserver',
  'coc-rust-analyzer',
  'coc-json',
  'coc-vimtex',
  'coc-css',
  'coc-lua',
  'coc-python',
  'coc-java',
  'coc-java-debug',
  'coc-solargraph',
  'coc-vetur',
  'coc-svelte',
  'coc-go',
  'coc-clangd'
}

-- coc config
vim.cmd('source $HOME/.config/nvim/coc.lua')

-- fixing popups
function CheckBackspace()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.')[col]:match('%s+') ~= nil
end
vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "<C-n>" : CheckBackspace() ? "<Tab>" : coc#refresh()', { expr = true })
vim.api.nvim_set_keymap('i', '<cr>', 'pumvisible() ? coc#_select_confirm() : "<cr>"', { expr = true })
vim.api.nvim_set_keymap('i', '<c-space>', 'coc#refresh()', { silent = true, expr = true })

-- theme
vim.cmd('colorscheme gruvbox-material')

-- explorer
vim.api.nvim_set_keymap('n', '<space>e', '<Cmd>NERDTree<CR>', { noremap = true })

-- coc-pairs to comply with closetag
vim.api.nvim_command('autocmd FileType html let b:coc_pairs_disabled = ["<"]')

-- close tag on go tmpl files
vim.api.nvim_command('autocmd BufNewFile,BufRead *.tmpl set filetype=html')
vim.api.nvim_command('autocmd BufNewFile,BufRead *.gohtml set filetype=html')
vim.api.nvim_command('autocmd BufNewFile,BufRead *.jet set filetype=html')

-- coc go
vim.api.nvim_command('autocmd BufWritePre *.go :silent call CocAction("runCommand", "editor.action.organizeImport")')

vim.cmd('command! -nargs=0 OR :silent call CocAction("runCommand", "editor.action.organizeImport")')

-- vim tex
vim.g.vimtex_view_method = 'zathura'

-- vim tex dependencies
-- biber, texmk (texlive-most)

-- rust
vim.g.rustfmt_autosave = 1

-- better closetag behaviour on react
vim.g.closetag_xhtml_filetypes = 'xhtml,jsx,tsx'

-- ts format on save
-- depends on tslint
vim.api.nvim_command('autocmd BufWritePre *.ts,*.tsx CocCommand tsserver.organizeImports')
vim.api.nvim_command('autocmd BufWritePre *.ts,*.tsx silent execute "CocCommand" "editor.action.format"')
vim.api.nvim_command('autocmd FileType typescript setlocal formatprg=tslint\\ --fix\\ --project\\ .\\ --format\\ stylish')

-- disable jedi completions for coc-python
vim.g.jedi_completions_enabled = 0

-- conjure
-- map ee :ConjureEval<CR>

-- rainbow parentheses
-- vim.api.nvim_command('augroup rainbow_lisp')
-- vim.api.nvim_command('  autocmd!')
-- vim.api.nvim_command('  autocmd FileType lisp,clojure,scheme RainbowParentheses')
-- vim.api.nvim_command('augroup END')

-- External config file
-- luafile ~/.config/nvim/lsp.lua

-- lualine config
 require('lualine').setup {
   options = {
     icons_enabled = true,
     theme = 'gruvbox',
     component_separators = { left = '', right = '' },
     section_separators = { left = '', right = '' },
     disabled_filetypes = {},
     always_divide_middle = true,
     globalstatus = false,
     diff_color = {
       added = { fg = "#fe8019" },
       modified = { fg = "#fe8019" },
       removed = { fg = "#cc241d" }
     }
   },
   sections = {
     lualine_a = { 'mode' },
     lualine_b = { 'branch', 'diff', 'diagnostics' },
     lualine_c = { 'filename' },
     lualine_x = { 'encoding', 'fileformat', 'filetype' },
     lualine_y = { 'progress' },
     lualine_z = { 'location' }
   },
   inactive_sections = {
     lualine_a = {},
     lualine_b = {},
     lualine_c = { 'filename' },
     lualine_x = { 'location' },
     lualine_y = {},
     lualine_z = {}
   },
   tabline = {},
   extensions = {}
}

-- dependencies
-- python3 -m pip install pynvim
-- pip install flake8
-- bear for clang correct autocompletion of third party libraries
 
