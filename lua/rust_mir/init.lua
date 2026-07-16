local M = {}

local function is_rust_file()
  return vim.bo.filetype == "rust"
end

-- Generate MIR using rustc
local function generate_mir()
  local cmd = {
    "cargo",
    "rustc",
    "--",
    "--emit",
    "mir",
  }

  local result = vim.fn.systemlist(cmd)
  if vim.v.shell_error ~= 0 then
    return nil, result
  end

  return result, nil
end

-- Open vertical split and display MIR

local function open_split_with_content()

  vim.cmd("vsplit")

  local content = vim.fn.systemlist({
    "cat",
    "target/debug/deps/*.mir"
  })

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_win_set_buf(0, buf)

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, content)
  vim.bo.buftype = "nofile"
  vim.bo.bufhidden = "wipe"
  vim.bo.swapfile = false
  vim.bo.filetype = "rust" -- optional for highlighting
end


-- Main function

function M.show_mir()
  if not is_rust_file() then
    print("Not a Rust file")
    return
  end

  local file_path = vim.fn.expand("%.p")

  local mir, err = generate_mir(file_path)

  if err then
    print("Error generating MIR:")
    print(table.concat(err, "\n"))
    return
  end
  open_split_with_content()
end

return M
