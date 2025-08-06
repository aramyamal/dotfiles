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
    "<leader>1",
    function() ui.nav_file(1) end,
    { desc = "Harpoon: Go to File 1" }
)

vim.keymap.set(
    "n",
    "<leader>2",
    function() ui.nav_file(2) end,
    { desc = "Harpoon: Go to File 2" }
)

vim.keymap.set(
    "n",
    "<leader>3",
    function() ui.nav_file(3) end,
    { desc = "Harpoon: Go to File 3" }
)

vim.keymap.set(
    "n",
    "<leader>4",
    function() ui.nav_file(4) end,
    { desc = "Harpoon: Go to File 4" }
)

vim.keymap.set(
    "n",
    "<leader>5",
    function() ui.nav_file(5) end,
    { desc = "Harpoon: Go to File 5" }
)

vim.keymap.set(
    "n",
    "<leader>6",
    function() ui.nav_file(6) end,
    { desc = "Harpoon: Go to File 6" }
)

vim.keymap.set(
    "n",
    "<leader>7",
    function() ui.nav_file(7) end,
    { desc = "Harpoon: Go to File 7" }
)

vim.keymap.set(
    "n",
    "<leader>8",
    function() ui.nav_file(8) end,
    { desc = "Harpoon: Go to File 8" }
)

vim.keymap.set(
    "n",
    "<leader>9",
    function() ui.nav_file(9) end,
    { desc = "Harpoon: Go to File 9" }
)

vim.keymap.set(
    "n",
    "<leader>0",
    function() ui.nav_file(10) end,
    { desc = "Harpoon: Go to File 10" }
)
