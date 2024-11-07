-- Buffers as tabs
return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    -- 'nvim-telescope/telescope.nvim',
    -- 'folke/which-key.nvim',
  },
  init = function()
    require('barbar').setup()
    vim.g.barbar_auto_setup = false
    local opts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap('n', '<Tab>', '<Cmd>BufferNext<CR>', opts)
    vim.api.nvim_set_keymap('n', '<S-Tab>', '<Cmd>BufferPrevious<CR>', opts)
    vim.api.nvim_set_keymap('n', '<leader>x', '<Cmd>BufferClose<CR>', { desc = '[X] Close buffer tab', noremap = true, silent = true })
    -- vim.keymap.set('n', '<leader>x', '<Cmd>BufferClose<CR>', { desc = '[X] Close buffer tab', noremap = true, silent = true })
  end,
  version = '^1.0.0', -- optional: only update when a new 1.x version is released
}
