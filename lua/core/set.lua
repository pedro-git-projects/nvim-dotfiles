-- Make cursor blink on insert mode
vim.opt.guicursor = "n-v-c-sm:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor-blinkwait175-blinkoff150-blinkon175"

-- Rest of your existing configurations
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

-- better bar with file info
vim.o.laststatus = 2

-- title for dwm bar
vim.o.title = true

-- better forcing
vim.o.confirm = true

-- clipboard copy has xclip as dependency
vim.o.clipboard = 'unnamedplus'
