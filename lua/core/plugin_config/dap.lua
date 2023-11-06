-- Debugging keymaps
vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>", { desc = "Debugger continue" })
vim.keymap.set("n", "<F10>", ":lua require'dap'.step_over()<CR>", { desc = "Debugger step over" })
vim.keymap.set("n", "<F11>", ":lua require'dap'.step_into()<CR>", { desc = "Debugger step into" })
vim.keymap.set("n", "<F12>", ":lua require'dap'.step_out()<CR>", { desc = "Debugger step out" })
vim.keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", { desc = "Toggle conditional breakpoint" })
vim.keymap.set("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", { desc = "Set breakpoint message" })
vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>", { desc = "Debugger Open Repl" })
vim.keymap.set("n", "<leader>dt", ":lua require'dap-go'.debug_test()<CR>", { desc = "Debugger Debug test" })


local dap, dapui = require("dap"), require("dapui")
local dap_utils = require("dap.utils")

-- virtual text
require("nvim-dap-virtual-text").setup()

require('dap-go').setup();

-- dap ui

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- mason dap update
require("mason-nvim-dap").setup({
  automatic_setup = true,
  ensure_installed = { "python", "delve", "js-debug_adapter@v1.76.1" },
  handlers = {}
})


-- dap vscode js
require("dap-vscode-js").setup({
  debugger_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter",
  debugger_cmd = { "js-debug-adapter" },
  adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }
})

local exts = {
  "javascript",
  "javascriptreact",
  "vue",
  "svelte"
};

for i, ext in ipairs(exts) do
  dap.configurations[ext] = {
    {
      type = "pwa-chrome",
      request = "launch",
      name = "Launch chrome with \"localhost\"",
      url = "http://localhost:3000",
      webRoot = "${workspaceFolder}"
    },
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch Current File (pwa-node)",
      cwd = vim.fn.getcwd(),
      args = { "${file}" },
      sourceMaps = true,
      protocol = "inspector"
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach Program (pwa-node, select pid)",
      cwd = vim.fn.getcwd(),
      processId = dap_utils.pick_process,
      skipFiles = { "<node_internals>/**" },
    }
  }
end
