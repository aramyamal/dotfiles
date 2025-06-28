require("mason").setup()
local dap = require("dap")
require("mason-nvim-dap").setup({
    ensure_installed = { "codelldb", "debugpy", "delve", "cpp" },
    handlers = {},
})

local dap = require("dap")

vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end, {
  desc = "DAP: Toggle Breakpoint"
})
vim.keymap.set("n", "<F9>", function() dap.toggle_breakpoint() end, {
  desc = "DAP: Toggle Breakpoint"
})
vim.keymap.set("n", "<F5>", function() dap.continue() end, {
  desc = "DAP: Continue/Start Debugging"
})
vim.keymap.set("n", "<F10>", function() dap.step_over() end, {
  desc = "DAP: Step Over"
})
vim.keymap.set("n", "<F11>", function() dap.step_into() end, {
  desc = "DAP: Step Into"
})
-- Shift + F11 = F23
vim.keymap.set("n", "<F23>", function() dap.step_out() end, {
  desc = "DAP: Step Out"
})
vim.keymap.set("n", "<F12>", function() dap.step_back() end, {
  desc = "DAP: Step Back"
})
-- Shift + F5 = F17
vim.keymap.set("n", "<F17>", function() dap.terminate() end, {
  desc = "DAP: Terminate Debugging"
})


local dapui = require("dapui")
dapui.setup()
dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end
