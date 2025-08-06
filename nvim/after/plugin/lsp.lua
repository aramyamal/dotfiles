local lsp_zero = require('lsp-zero')

-- auto format on save / write
vim.api.nvim_create_augroup("AutoFormat", {})
vim.api.nvim_create_autocmd(
    "BufWritePost",
    {
        pattern = { "*.rs", "*.lua", "*.go", "*.ts", "*.cpp", "*.c", "*.h, *.ts, *.js, *.html, *.css" },
        group = "AutoFormat",
        callback = function()
            vim.lsp.buf.format()
        end,
    }
)

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

--- if you want to know more about lsp-zero and mason.nvim
--- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { "gopls", "clangd", "pylsp", "lua_ls", "rust_analyzer", "html" },
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
    },
})

-- Map automatic code action to Alt+Enter
vim.keymap.set("n", "<A-cr>", function() vim.lsp.buf.code_action() end)

-- Show diagnostic of current line with <leader> + D + I
vim.keymap.set(
    "n",
    "<leader>di",
    function() vim.diagnostic.open_float() end,
    { desc = "LSP: Show Line Diagnostics" }
)

-- Jump to next diagnostic with g + [ or g + ]
vim.keymap.set("n", "g]", vim.diagnostic.goto_next)
vim.keymap.set("n", "g[", vim.diagnostic.goto_prev)

-- ### Custom cmp configs: ###
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
        ['<C-j>'] = cmp_action.luasnip_supertab(),
        ['<C-k>'] = cmp_action.luasnip_shift_supertab()
    }),
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
})

-- ### Custom lsp configs: ###
local lspconfig = require('lspconfig')

-- C
-- lspconfig.clangd.setup({
--     cmd = {
--         "clangd",
--         "--background-index",
--         "-j=12",
--         "--query-driver=/usr/bin/**/clang-*,/bin/clang,/bin/clang++,/usr/bin/gcc,/usr/bin/g++",
--         "--clang-tidy",
--         "--clang-tidy-checks=*",
--         "--all-scopes-completion",
--         "--cross-file-rename",
--         "--completion-style=detailed",
--         "--header-insertion-decorators",
--         "--header-insertion=iwyu",
--         "--pch-storage=memory",
--     },
-- })
--
-- lspconfig.ts_ls.setup {
--     settings = {
--         typescript = {
--             format = {
--                 indentSize = 2,
--                 tabSize = 2,
--                 convertTabsToSpaces = true,
--             },
--         },
--         javascript = {
--             format = {
--                 indentSize = 2,
--                 tabSize = 2,
--                 convertTabsToSpaces = true,
--             },
--         },
--     },
-- }


-- -- TypeScript
-- lspconfig.ts_ls.setup({
--     settings = {
--         typescript = {
--             inlayHints = {
--                 includeInlayParameterNameHints = "none",
--                 includeInlayParameterNameHintsWhenArgumentMatchesName = true,
--                 includeInlayFunctionParameterTypeHints = true,
--                 includeInlayVariableTypeHints = true,
--                 includeInlayVariableTypeHintsWhenTypeMatchesName = true,
--                 includeInlayPropertyDeclarationTypeHints = true,
--                 includeInlayFunctionLikeReturnTypeHints = true,
--                 includeInlayEnumMemberValueHints = true,
--             },
--             format = {
--                 indentSize = 2,
--                 tabSize = 2,
--                 convertTabsToSpaces = true,
--             },
--         },
--         javascript = {
--             inlayHints = {
--                 includeInlayParameterNameHints = "none",
--                 includeInlayParameterNameHintsWhenArgumentMatchesName = true,
--                 includeInlayFunctionParameterTypeHints = true,
--                 includeInlayVariableTypeHints = true,
--                 includeInlayVariableTypeHintsWhenTypeMatchesName = true,
--                 includeInlayPropertyDeclarationTypeHints = true,
--                 includeInlayFunctionLikeReturnTypeHints = true,
--                 includeInlayEnumMemberValueHints = true,
--             },
--             format = {
--                 indentSize = 2,
--                 tabSize = 2,
--                 convertTabsToSpaces = true,
--             },
--         },
--     },
-- })

-- -- Java
-- lspconfig.java_language_server.setup {
--     handlers = {
--         ['client/registerCapability'] = function(err, result, ctx, config)
--             local registration = {
--                 registrations = { result },
--             }
--             return vim.lsp.handlers['client/registerCapability'](err, registration, ctx, config)
--         end
--     },
--
-- }

-- Lua
lspconfig.lua_ls.setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = {
                    'vim'
                }
            }
        }
    }
}
-- From https://lsp-zero.netlify.app/v3.x/blog/theprimeagens-config-from-2022.html
-- vim.api.nvim_create_autocmd('LspAttach', {
--   group = vim.api.nvim_create_augroup('user_lsp_attach', {clear = true}),
--   callback = function(event)
--     local opts = {buffer = event.buf}
--
--     vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
--     vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
--     vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, opts)
--     vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, opts)
--     vim.keymap.set('n', '<a-cr>', function() vim.lsp.buf.code_action() end, opts)
--     vim.keymap.set('n', '<leader>rn', function() vim.lsp.buf.rename() end, opts)
--   end,
-- })
--
-- local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
--
-- require('mason').setup({})
-- require('mason-lspconfig').setup({
--   ensure_installed = {'tsserver', 'rust_analyzer'},
--   handlers = {
--     function(server_name)
--       require('lspconfig')[server_name].setup({
--         capabilities = lsp_capabilities,
--       })
--     end,
--     lua_ls = function()
--       require('lspconfig').lua_ls.setup({
--         capabilities = lsp_capabilities,
--         settings = {
--           Lua = {
--             runtime = {
--               version = 'LuaJIT'
--             },
--             diagnostics = {
--               globals = {'vim'},
--             },
--             workspace = {
--               library = {
--                 vim.env.VIMRUNTIME,
--               }
--             }
--           }
--         }
--       })
--     end,
--   }
-- })
--
-- local cmp = require('cmp')
-- local cmp_select = {behavior = cmp.SelectBehavior.Select}
--
-- -- this is the function that loads the extra snippets to luasnip
-- -- from rafamadriz/friendly-snippets
-- require('luasnip.loaders.from_vscode').lazy_load()
--
-- cmp.setup({
--   sources = {
--     {name = 'path'},
--     {name = 'nvim_lsp'},
--     {name = 'luasnip', keyword_length = 2},
--     {name = 'buffer', keyword_length = 3},
--   },
--   mapping = cmp.mapping.preset.insert({
--     ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--     ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
--     ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--     ['<S>'] = cmp.mapping.select_next_item(cmp_select),
--     ['<C-y>'] = cmp.mapping.confirm({ select = true }),
--     ['<C-Space>'] = cmp.mapping.complete(),
--   }),
--   snippet = {
--     expand = function(args)
--       require('luasnip').lsp_expand(args.body)
--     end,
--   },
-- })
