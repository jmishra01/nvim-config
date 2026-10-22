local M = {}

local function is_rust_file()
  return vim.bo.filetype == "rust"
end

-- Generate MIR using rustc, run from the crate root
local function generate_mir(root)
  local result = vim.system({
    "cargo",
    "rustc",
    "--",
    "--emit",
    "mir",
  }, { cwd = root, text = true }):wait()

  if result.code ~= 0 then
    return nil, vim.split(result.stderr, "\n")
  end

  return true, nil
end

-- Newest .mir file emitted by cargo
local function latest_mir_file(root)
  local files = vim.fn.glob(root .. "/target/debug/deps/*.mir", false, true)
  table.sort(files, function(a, b)
    return vim.fn.getftime(a) > vim.fn.getftime(b)
  end)
  return files[1]
end

-- Open vertical split and display MIR
local function open_split_with_content(content)
  vim.cmd("vsplit")

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_win_set_buf(0, buf)

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, content)
  vim.bo[buf].buftype = "nofile"
  vim.bo[buf].bufhidden = "wipe"
  vim.bo[buf].swapfile = false
  vim.bo[buf].filetype = "rust" -- optional for highlighting
end


-- Main function

function M.show_mir()
  if not is_rust_file() then
    print("Not a Rust file")
    return
  end

  local root = vim.fs.root(0, "Cargo.toml")
  if not root then
    print("No Cargo.toml found")
    return
  end

  local _, err = generate_mir(root)
  if err then
    print("Error generating MIR:")
    print(table.concat(err, "\n"))
    return
  end

  local mir_file = latest_mir_file(root)
  if not mir_file then
    print("No .mir file found in target/debug/deps")
    return
  end

  open_split_with_content(vim.fn.readfile(mir_file))
end

return M
