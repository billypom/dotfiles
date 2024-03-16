-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

-- Move current line up - normal mode
vim.api.nvim_set_keymap("n", "<A-k>", ":m .-2<CR>==", {noremap = true, silent = true})
-- Move current line down - normal mode
vim.api.nvim_set_keymap("n", "<A-j>", ":m .+1<CR>==", {noremap = true, silent = true})
-- Move current line up - visual mode
vim.api.nvim_set_keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
-- Move current line down - visual mode
vim.api.nvim_set_keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

vim.opt.relativenumber = true

vim.opt.number = true

vim.opt.guicursor = "n-v-i-c:block-Cursor" -- defines the cursor in all modes to the nice thick block <3

