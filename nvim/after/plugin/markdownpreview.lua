vim.keymap.set(
    "n",
    "<leader>mp",
    function()
        vim.cmd("MarkdownPreviewToggle")
    end,
    { desc = "Markdown: Toggle Preview" }
)
