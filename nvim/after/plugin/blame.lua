require('blame').setup {}

vim.keymap.set("n", "<leader>gb", vim.cmd.BlameToggle, { desc = "Git Blame" })
