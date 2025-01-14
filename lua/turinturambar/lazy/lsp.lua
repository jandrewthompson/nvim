--- Uncomment the two plugins below if you want to manage the language servers from neovim
return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},
        {'neovim/nvim-lspconfig'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-nvim-lua'},
        {'hrsh7th/cmp-nvim-lsp-signature-help'},
        {'hrsh7th/cmp-vsnip'},
        {'hrsh7th/cmp-path'},
        {'hrsh7th/cmp-calc'},
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/vim-vsnip'},
        {'glepnir/lspsaga.nvim'},
        {'PaterJason/cmp-conjure'},
        {'L3MON4D3/LuaSnip'},
        {'mfussenegger/nvim-dap'},
    },
    config = function()
        ---
        -- LSP setup
        ---
        local lsp_zero = require('lsp-zero')
        
--        vim.g["conjure#filetypes"] = {'clojure'}
 --       vim.g["conjure#filetype_suffixes#rust"] = 'false'

        lsp_zero.on_attach(function(client, bufnr)
            -- see :help lsp-zero-keybindings
            -- to learn the available actions
            lsp_zero.default_keymaps({buffer = bufnr})
        end)

        --- if you want to know more about mason.nvim
        --- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
        require('mason').setup({})
        require('mason-lspconfig').setup({
            handlers = {
                -- this first function is the "default handler"
                -- it applies to every language server without a "custom handler"
                function(server_name)
                    require('lspconfig')[server_name].setup({})
                end,

                -- this is the "custom handler" for `lua_ls`
                lua_ls = function()
                    -- (Optional) configure lua language server
                    local lua_opts = lsp_zero.nvim_lua_ls()
                    require('lspconfig').lua_ls.setup(lua_opts)
                end,

                basedpyright = function()
                    require('lspconfig').basedpyright.setup {
                        -- capabilities = capabilities,
                        settings = {
                            basedpyright = {
                                typeCheckingMode = "standard",
                            },
                        },
                    }
                end,
                pylsp = function()
                    require('lspconfig').pylsp.setup {
                        settings = {
                            pylsp = {
                                plugins = {
                                    -- formatter options
                                    black = { enabled = true },
                                    autopep8 = { enabled = false },
                                    yapf = { enabled = false },
                                    -- linter options
                                    pylint = { enabled = true, executable = "pylint" },
                                    ruff = { enabled = false },
                                    pyflakes = { enabled = false },
                                    pycodestyle = { enabled = false },
                                    -- type checker
                                    pylsp_mypy = {
                                        enabled = true,
                                        -- overrides = { "--python-executable", py_path, true },
                                        report_progress = true,
                                        live_mode = false
                                    },
                                    -- auto-completion options
                                    jedi_completion = { fuzzy = true },
                                    foo = { fuzzy = true },
                                    rope = { enabled = true },
                                    -- import sorting
                                    isort = { enabled = true },
                                },
                            },
                        },
                        flags = {
                            debounce_text_changes = 200,
                        },
                    }
                end,
                purescriptls = function()
                    require('lspconfig').purescriptls.setup {
                        settings = {
                            purescript = {
                                formatter = "purs-tidy",
                            },
                        }
                    }
                end
                
            }
        })

        ---
        -- Autocompletion config
        ---
        local cmp = require('cmp')
        local cmp_action = lsp_zero.cmp_action()

        cmp.setup({
            preselect = 'item',
            completion = {
                completeopt = 'menu,menuone,noinsert'
            },
            mapping = cmp.mapping.preset.insert({
                -- `Enter` key to confirm completion
                ['<CR>'] = cmp.mapping.confirm({select = true}),

                -- Ctrl+Space to trigger completion menu
                ['<C-Space>'] = cmp.mapping.complete(),

                -- Navigate between snippet placeholder
                ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                ['<C-b>'] = cmp_action.luasnip_jump_backward(),

                -- Scroll up and down in the completion documentation
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
            }),
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            sources = {
                { name = 'path' },                              -- file paths
                { name = 'nvim_lsp', keyword_length = 3 },      -- from language server
                { name = 'nvim_lsp_signature_help'},            -- display function signatures with current parameter emphasized
                { name = 'nvim_lua', keyword_length = 2},       -- complete neovim's Lua runtime API such vim.lsp.*
                { name = 'buffer', keyword_length = 2 },        -- source current buffer
                { name = 'vsnip', keyword_length = 2 },         -- nvim-cmp source for vim-vsnip 
                { name = 'conjure' },
                { name = 'calc' },                               -- source for math calculation
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            formatting = {
                fields = {'menu', 'abbr', 'kind'},
                format = function(entry, item)
                    local menu_icon ={
                        nvim_lsp = 'λ',
                        vsnip = '⋗',
                        buffer = 'Ω',
                        path = '🖫',
                        calc = '🖩',
                    }
                    item.menu = menu_icon[entry.source.name]
                    return item
                end,
            },
        })




    end
}
