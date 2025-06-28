require("aramjamal.remap")
require("aramjamal.set")
require("aramjamal.packer")

-- Automatically adjust theme of nvim according to system theme
vim.o.background = "light"
vim.cmd("colorscheme everforest")

if vim.fn.system('get_theme_mode'):gsub('\n', '') == "dark" then
    vim.cmd("colorscheme base16-black-metal")
end
