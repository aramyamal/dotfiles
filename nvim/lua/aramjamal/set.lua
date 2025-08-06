-- -- highlight
-- vim.opt.cuc = true
-- vim.opt.cul = true

-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Indents
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Let Undotree do all undos with "u"
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.config/nvi/undodir"
vim.opt.undofile = true

-- Remove highlight search and add increment search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Enable 24-bit RGB color in the terminal window
vim.opt.termguicolors = true

-- Cursor always 8 characters from bottom or top
vim.opt.scrolloff = 8

-- -- Make the signcolumn more compact
-- vim.opt.signcolumn = "number"

-- Show signcolumn
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

-- Guide column to not write more than 79 characters
vim.opt.colorcolumn = "81"

-- Set the <leader> to " "
vim.g.mapleader = " "

-- Make command line height invisible
vim.opt.cmdheight = 0

-- Show diagnostics inline
vim.diagnostic.config({
    virtual_lines = false,
    virtual_text = true,
    underline = true,
    signs = true,
    severity_sort = true,
    update_in_insert = true
})
