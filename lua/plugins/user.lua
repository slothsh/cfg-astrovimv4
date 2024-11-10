-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

    -- == Examples of Adding Plugins ==

    "andweeb/presence.nvim",
    {
        "ray-x/lsp_signature.nvim",
        event = "BufRead",
        config = function() require("lsp_signature").setup() end,
    },

    -- == Examples of Overriding Plugins ==

    -- customize alpha options
    {
        "goolord/alpha-nvim",
        opts = function(_, opts)
            opts.section.header.val = {
                [[                                                    ]],
	            [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
	            [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
	            [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
	            [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
	            [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
	            [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
	            [[                                                    ]],
            }
            return opts
        end,
    },

    -- You can disable default plugins as follows:
    { "max397574/better-escape.nvim", enabled = false },

    -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
    {
        "L3MON4D3/LuaSnip",
        config = function(plugin, opts)
            require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
            -- add more custom luasnip configuration such as filetype extend or custom snippets
            local luasnip = require "luasnip"
            luasnip.filetype_extend("php", { "html" })
            luasnip.filetype_extend("javascript", { "javascriptreact" })
            require("luasnip.loaders.from_vscode").lazy_load({
                paths = { vim.fn.stdpath("config") .. "/snippets" },
            })
        end,
    },

    {
        "windwp/nvim-autopairs",
        config = function(plugin, opts)
            require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
            -- add more custom autopairs configuration such as custom rules
            local npairs = require "nvim-autopairs"
            local Rule = require "nvim-autopairs.rule"
            local cond = require "nvim-autopairs.conds"
            npairs.add_rules(
                {
                    Rule("$", "$", { "tex", "latex" })
                        -- don't add a pair if the next character is %
                        :with_pair(cond.not_after_regex "%%")
                        -- don't add a pair if  the previous character is xxx
                        :with_pair(
                            cond.not_before_regex("xxx", 3)
                        )
                        -- don't move right when repeat character
                        :with_move(cond.none())
                        -- don't delete if the next character is xx
                        :with_del(cond.not_after_regex "xx")
                        -- disable adding a newline when you press <cr>
                        :with_cr(cond.none()),
                },
                -- disable for .vim files, but it work for another filetypes
                Rule("a", "a", "-vim")
            )
        end,
    },

    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },

    {
        "elkowar/yuck.vim",
        event = "VeryLazy",
        config = function()
        end
    },

    -- {
    --   'mg979/vim-visual-multi',
    --   event = "VeryLazy",
    --   config = function()
    --   end
    -- },

    {
        "LhKipp/nvim-nu",
        event = "VeryLazy",
        config = function()
            require("nu").setup({})
        end
    },

    {
        "xiyaowong/transparent.nvim",
        event = "VeryLazy",
        config = function()
            require("transparent").setup({
                exclude_groups = {
                    'CursorLine', 'CursorLineNr'
                }
            })
        end
    },
    { "johmsalas/text-case.nvim",
        event = "VeryLazy",
        config = function()
            require("textcase").setup({})
        end
    },

    {
        "brenton-leighton/multiple-cursors.nvim",
        event = "BufRead",
        version = "*",  -- Use the latest tagged version
        opts = {},  -- This causes the plugin setup function to be called
        keys = {
            -- {"<Leader>l", "<Cmd>MultipleCursorsLock<CR>", mode = {"n", "x"}, desc = "Lock virtual cursors"},

            -- {"<C-j>", "<Cmd>MultipleCursorsAddDown<CR>", mode = {"n", "x"}, desc = "Add cursor and move down"},
            -- {"<C-k>", "<Cmd>MultipleCursorsAddUp<CR>", mode = {"n", "x"}, desc = "Add cursor and move up"},
            {"<C-A-Up>", "<Cmd>MultipleCursorsAddUp<CR>", mode = {"n", "i", "x"}, desc = "Add cursor and move up"},
            {"<C-A-Down>", "<Cmd>MultipleCursorsAddDown<CR>", mode = {"n", "i", "x"}, desc = "Add cursor and move down"},

            {"<C-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>", mode = {"n", "i"}, desc = "Add or remove cursor"},

            {"<Leader>aa", "<Cmd>MultipleCursorsAddMatches<CR>", mode = {"n", "x"}, desc = "Add cursors to cword"},
            {"<Leader>AA", "<Cmd>MultipleCursorsAddMatchesV<CR>", mode = {"n", "x"}, desc = "Add cursors to cword in previous area"},

            {"<Leader>a", "<Cmd>MultipleCursorsAddJumpNextMatch<CR>", mode = {"n", "x"}, desc = "Add cursor and jump to next cword"},
            {"<Leader>A", "<Cmd>MultipleCursorsJumpNextMatch<CR>", mode = {"n", "x"}, desc = "Jump to next cword"},

            {"gl", "<Cmd>MultipleCursorsAddJumpNextMatch<CR>", mode = {"n", "x"}, desc = "Add cursor and jump to next cword"},
            {"gL", "<Cmd>MultipleCursorsJumpNextMatch<CR>", mode = {"n", "x"}, desc = "Jump to next cword"},
            -- {"<C-n>", "<Cmd>MultipleCursorsAddJumpNextMatch<CR>", mode = {"n", "x"}, desc = "Add cursor and jump to next cword"},
            -- {"<C-S-n>", "<Cmd>MultipleCursorsJumpNextMatch<CR>", mode = {"n", "x"}, desc = "Jump to next cword"},
        },
    },

    {
        "gbprod/phpactor.nvim",
        config = function()
            require('lspconfig').phpactor.setup {
                root_dir = function(fname)
                    return require('lspconfig.util').path.dirname(fname)
                end,

                init_options = {
                    ["language_server_phpstan.enabled"] = false,
                    ["language_server_psalm.enabled"] = false,
                }
            }
        end
    },

    {
        "fedepujol/move.nvim",
        event = "VeryLazy",
        opts = {},
        config = function()
            vim.api.nvim_create_user_command("MoveLineMotion", function(args)
                local sign = args.args/math.abs(args.args)
                local n = (args.line2 - args.line1)*sign + args.args
                vim.cmd{ cmd = "MoveLine", args = { n } }
            end, { nargs = 1, range = true, desc = "move.nvim MoveLine wrapper with motions" })
            require("move").setup({})
        end
    }
}
