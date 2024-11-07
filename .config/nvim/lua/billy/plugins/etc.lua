return {
  'barklan/capslock.nvim', -- caps lock as esc
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  'MaxMEllon/vim-jsx-pretty', -- React syntax highlighting and indenting plugin
  'suy/vim-context-commentstring', -- Change the format of the comment string, depending on the file region
  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
}
