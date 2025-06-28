local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local term = require("harpoon.tmux")

vim.keymap.set(
    "n",
    "<leader>a",
    mark.add_file,
    { desc = "Harpoon: Add File" }
)

vim.keymap.set(
    "n",
    "<C-e>",
    ui.toggle_quick_menu,
    { desc = "Harpoon: Toggle Quick Menu" }
)

vim.keymap.set(
    "n",
    "<C-j>",
    function() ui.nav_file(1) end,
    { desc = "Harpoon: Go to File 1" }
)

vim.keymap.set(
    "n",
    "<C-k>",
    function() ui.nav_file(2) end,
    { desc = "Harpoon: Go to File 2" }
)

vim.keymap.set(
    "n",
    "<C-l>",
    function() ui.nav_file(3) end,
    { desc = "Harpoon: Go to File 3" }
)

vim.keymap.set(
    "n",
    "<C-m>",
    function() ui.nav_file(4) end,
    { desc = "Harpoon: Go to File 4" }
)

vim.keymap.set(
    "n",
    "<C-,>",
    function() ui.nav_file(5) end,
    { desc = "Harpoon: Go to File 5" }
)

vim.keymap.set(
    "n",
    "<C-.>",
    function() ui.nav_file(6) end,
    { desc = "Harpoon: Go to File 6" }
)
