require('gitsigns').setup({
    current_line_blame = true
})

vim.keymap.set("n", "<leader>gt", function()
    vim.cmd("Gitsigns toggle_current_line_blame")
end, { desc = "Git Blame Inline Toggle" })

vim.keymap.set("n", "<leader>gl", "<Cmd>Gitsigns blame_line<CR>", { desc = "Git Blame Line" })
