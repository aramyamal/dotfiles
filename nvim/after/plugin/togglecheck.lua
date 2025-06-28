-- toggle checked / create checkbox if it doesn't exist
vim.keymap.set('n', '<leader>cc', require('markdown-togglecheck').toggle, { desc = 'Toggle Checkmark' });
-- toggle checkbox (it doesn't remember toggle state and always creates [ ])
vim.keymap.set('n', '<leader>CC', require('markdown-togglecheck').toggle_box, { desc = 'Toggle Checkbox' });
