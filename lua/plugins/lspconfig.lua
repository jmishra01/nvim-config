require("neodev").setup {}

require("nvim-lsp-installer").setup({
  automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
})


-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>op', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)

  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end


local lspconfig = require('lspconfig')

local lsputils = require('lspconfig.util')

local lsp_flags = { debounce_text_changes = 150 }


--
-- PYTHON
local function get_python_path(workspace)
  -- Use activated virtualenv
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIR, 'bin', 'python')
  end
  -- Find and use vurtualenv in workspace directory
  for _, pattern in ipairs({ '*', '.*' }) do
    local match = vim.fn.glob(path.join(workspace, pattern, 'pyenv.cfg'))
    if match ~= '' then
      return path.join(path.dirname(match), 'bin', 'python')
    end
  end

  -- Fallback to system python
  return exepath('python3') or exepath('python') or 'python'
end

lspconfig['pyright'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
  before_init = function(_, config)
    config.settings.python.pythonPath = get_python_path(config.root_dir)
  end,
  settings = {
    pyright = {
      venvPath = io.popen("which python3"):read("*a")
    }
  }
}

-- RUST
require('lspconfig')['rust_analyzer'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
  settings = {
    ["rust_analyzer"] = {
      imports = { granularity = { group = "module" }, prefix = "self" },
      cargo = { buildScripts = { enable = true } },
      procMarco = { enable = true }
    }
  }
}


-- GOLANG
lspconfig.gopls.setup {
  on_attach = on_attach,
  flags = lsp_flags,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = lsputils.root_pattern("go.mod", ".gi"),
  single_file_support = true
}


lspconfig["ccls"].setup{}
-- lspconfig["clangd"].setup {
--   on_attach = on_attach,
--   flags = lsp_flags,
--   cmd = {
--     "clangd",
--     "--background-index",
--     '--query-driver="/usr/bin/gcc, \
--                     /usr/bin/g++, \
--                     /usr/bin/clang, \
--                     /usr/bin/clang++"',
--     "-I/home/netlink/.local/include/opencv4",
--     "--clang-tidy",
--     "--all-scopes-completion",
--     "--cross-file-rename",
--     "--completion-style=detailed",
--     "--header-insertion-decorators",
--     "--header-insertion=iwyu",
--     "--pch-storage=memory",
--     "--enable-config",
--     "--log=verbose"
--   },
--   filetypes = { "c", "cpp", "objc", "objcpp" },
--   single_file_support = true,
--   root_dir=lsputils.root_pattern(
--           '.clangd',
--           '.clang-tidy',
--           '.clang-format',
--           'compile_commands.json',
--           'compile_flags.txt',
--           'configure.ac',
--           '.git'
--         )
-- }

-- LUA
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
lspconfig['lua_ls'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = runtime_path,
      },
      completion = { keywordSnippet = "Disable", },
      diagnostics = {
        enable = true,
        globals = {
          "vim",
          "describe",
          "it",
          "before_each",
          "after_each"
        },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
          vim.api.nvim_get_runtime_file("", true)
        }
      }
    }
  }
}
