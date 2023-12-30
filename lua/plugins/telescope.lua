return {
  'nvim-telescope/telescope.nvim', branch='master',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require("telescope").setup({})
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<C-p>', builtin.find_files, {})
      vim.keymap.set('n', '<C-f>', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    end
}
