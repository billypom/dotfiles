-- Buffers as tabs
return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  init = function()
    require('barbar').setup()
    vim.g.barbar_auto_setup = false
    local opts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap('n', '<Tab>', '<Cmd>BufferNext<CR>', opts)
    vim.api.nvim_set_keymap('n', '<S-Tab>', '<Cmd>BufferPrevious<CR>', opts)
    vim.api.nvim_set_keymap('n', '<leader>x', '<Cmd>BufferClose<CR>', opts)
  end,
  version = '^1.0.0', -- optional: only update when a new 1.x version is released
}