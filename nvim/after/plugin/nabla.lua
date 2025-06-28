require("nabla").disable_virt({
    autogen = false, -- auto-regenerate ASCII art when exiting insert mode
    -- silent = true,     -- silents error messages
})

vim.keymap.set(
    'n',
    '<leader>lx',
    ':lua require("nabla").popup()<CR>',
    { desc = "Nabla: Show LaTeX Popup" }
)

vim.keymap.set(
    'n',
    '<leader>xx',
    function()
        require("nabla").enable_virt({
            autogen = true,
            silent = true,
        })
    end,
    { desc = "Nabla: Enable Virtual LaTeX" }
)

vim.keymap.set(
    'n',
    '<leader>ll',
    function()
        require("nabla").disable_virt()
    end,
    { desc = "Nabla: Disable Virtual LaTeX" }
)
