return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")
    ts.setup()

    -- The main branch no longer reads ensure_installed/highlight/indent from setup()
    ts.install({
      "c", "lua", "vim", "vimdoc", "query", "javascript", "html", "css",
      "python", "rust", "go", "svelte", "typescript", "tsx"
    })

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("UserTreesitter", {}),
      callback = function(args)
        -- Fails quietly when no parser exists for this filetype
        if pcall(vim.treesitter.start, args.buf) then
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end
    })
  end
}
