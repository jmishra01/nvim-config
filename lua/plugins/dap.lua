local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then return end

local dap_ui_status_ok, dapui = pcall(require, "dapui")
if not dap_ui_status_ok then return end

local dap_install_status_ok, dap_install = pcall(require, "dap-install")
if not dap_install_status_ok then return end

local dap_virtual_status_ok, dap_virtual_text = pcall(require, "nvim-dap-virtual-text")
if not dap_virtual_status_ok then return end

dap_virtual_text.setup {
  enabled = true,
  enabled_commands = true,
  all_frames = true
}
dap_install.setup {}

local status_ok, dap_py = pcall(require, 'dap-python')
if not status_ok then return end

dap_py.setup(io.popen("which python3"):read("*a"))

dap_py.test_runner = 'pytest'
local status_ok, utils = pcall(require, "core.utils")

if not status_ok then return end

utils.nkeymap("<F5>", "<Cmd>lua require'dap'.continue()<CR>")
utils.nkeymap("<C-s>", "<Cmd>lua require'dap'.step_over()<CR>")
utils.nkeymap("<C-i>", "<Cmd>lua require'dap'.step_into()<CR>")
utils.nkeymap("<Leader>su", "<Cmd>lua require'dap'.step_out()<CR>")
utils.nkeymap("<Leader>b", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>")
utils.nkeymap("<Leader>B", "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
utils.nkeymap("<Leader>lp", "<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")


dapui.setup {
  sidebar = {
    elements = {
      { id = "scopes", size = 0.25 }, -- Can be float or integer > 1
      { id = "breakpoints", size = 0.25 },
    },
    size = 40, position = "right", -- Can be "left", "right", "top", "bottom"
  },
  tray = { elements = {} },
}

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
