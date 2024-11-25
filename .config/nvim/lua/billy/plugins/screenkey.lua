return {
  'NStefan002/screenkey.nvim',
  version = '*', -- or branch = "dev", to use the latest commit
  config = function()
    require('screenkey').setup {
      win_opts = {
        relative = 'editor',
        height = 1,
        anchor = 'NE',
      },
      disable = {
        filetypes = {}, -- for example: "toggleterm"
        -- :h 'buftype'
        buftypes = {}, -- for example: "terminal"
      },
      display_infront = {},
    }
  end,
}
