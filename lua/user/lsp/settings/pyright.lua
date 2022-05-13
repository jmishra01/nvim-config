return {
  cmd ={"pyright-langserver", "--stdio"},
  filetypes={"python"},
  settings = {
    python = {
      pythonPath = "$HOME/.local/bin",
      analysis = {
        autoImportCompletions=true,
        autoSearchPaths = true,
        -- diagnosticMode = "workspace",
        useLibraryCodeForTypes = true
      }
    }
  }
}



