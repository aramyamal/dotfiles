local builtin = require('telescope.builtin')
vim.keymap.set(
  'n',
  '<leader>ff',
  builtin.find_files,
  { desc = "Telescope: Find Files" }
)

vim.keymap.set(
  'n',
  '<leader>fh',
  builtin.git_files,
  { desc = "Telescope: Find Git Files" }
)

vim.keymap.set(
  'n',
  '<leader>fg',
  builtin.live_grep,
  { desc = "Telescope: Live Grep" }
)

-- Map ? to Telescope keymaps
vim.keymap.set('n', '?', builtin.keymaps, { desc = "Telescope Keymaps" })

local actions = require("telescope.actions")
local telescope = require("telescope")

telescope.setup {
    defaults = {
        mappings = {
            i = {
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-j>"] = actions.move_selection_next,
            }
        }
    }
}
