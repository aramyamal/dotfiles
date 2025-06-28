require('Comment').setup({
    toggler = {
        line = '<C-\\>',
    },
    opleader = {
        line = '<C-\\>',
    }
})

vim.keymap.set('x', '/', '<Plug>(comment_toggle_linewise_visual)')
