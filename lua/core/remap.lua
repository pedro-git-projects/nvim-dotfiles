vim.g.mapleader = " "

-- vim.keymap.set("n", "<leader>w", vim.cmd.NvimTreeOpen) -- while in normal mode, pressing space pv will execute Ex
-- vim.keymap.set("n", "<leader>w", vim.cmd.Explore)
vim.keymap.set("n", "<leader>w", vim.cmd.CHADopen)

vim.api.nvim_set_keymap('n', '<c-s>', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<c-s>', '<Esc>:w<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "<C-F>", vim.cmd.LspZeroFormat) -- format with ctrl f
vim.api.nvim_set_keymap('n', 'q', ':quit<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>d', ':lua vim.diagnostic.open_float(0, {scope="line"})<CR>',
    { noremap = true, silent = true })
