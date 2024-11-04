-- Left nav pane
return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('nvim-tree').setup {}
    local opts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap('n', '<C-\\>', ':NvimTreeToggle<CR>', opts)
  end,
}
