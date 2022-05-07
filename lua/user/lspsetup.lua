local lsp_installer = require("nvim-lsp-installer")

local lsp_installer_servers = require('nvim-lsp-installer.servers')

local servers = {
    "rust_analyzer",
    "clangd",
    "pyright",
    "tsserver",
    "sumneko_lua",
}

for _, server_name in pairs(servers) do
    local server_available, server = lsp_installer_servers.get_server(server_name)
    if server_available then
        server:on_ready(function ()
            local opts = {}
            server:setup(opts)
        end)
        if not server:is_installed() then
            server:install()
        end
    end
end


local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, 'n', ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  local opts = { noremap=true, silent=true }

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  buf_set_keymap('gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  buf_set_keymap('<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap(']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
end

local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local servers = { 'pyright', 'rust_analyzer', 'tsserver' }

for _, lsp in ipairs(servers) do 
  lspconfig[lsp].setup {
    capabilities = capabilities,
    on_attach = on_attach,
  }
end
