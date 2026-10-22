return {
    'wsdjeg/git.nvim',
    dependencies = {
        'wsdjeg/job.nvim',       -- Required
        'wsdjeg/notify.nvim',    -- Recommended
    },
    config = function()
        vim.keymap.set('n', '<leader>gs', '<cmd>Git status<cr>', { silent = true })
        vim.keymap.set('n', '<leader>gA', '<cmd>Git add .<cr>', { silent = true })
        vim.keymap.set('n', '<leader>gc', '<cmd>Git commit<cr>', { silent = true })
        vim.keymap.set('n', '<leader>gv', '<cmd>Git log<cr>', { silent = true })
        vim.keymap.set('n', '<leader>gV', '<cmd>Git log %<cr>', { silent = true })
        vim.keymap.set('n', '<leader>gp', '<cmd>Git push<cr>', { silent = true })
        vim.keymap.set('n', '<leader>gP', '<cmd>Git pull<cr>', { silent = true })
        vim.keymap.set('n', '<leader>gd', '<cmd>Git diff<cr>', { silent = true })
        vim.keymap.set('n', '<leader>gS', '<cmd>Git stash<cr>', { silent = true })
        vim.keymap.set('n', '<leader>gB', '<cmd>Git blame<cr>', { silent = true })
        vim.keymap.set('n', '<leader>gR', '<cmd>Git remote<cr>', { silent = true })
    end,
}
