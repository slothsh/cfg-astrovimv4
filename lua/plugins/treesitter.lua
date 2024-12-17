-- Customize Treesitter

---@type LazySpec
return {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
        -- Defaults
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
            "lua",
            "vim",
            "c",
            "cpp",
            "php",
            "blade",
            "javascript",
            "typescript",
            "html",
            "css",
        })

        -- PHP Blade support
        local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
        parser_config.blade = {
            install_info = {
                url = "https://github.com/EmranMR/tree-sitter-blade",
                files = { "src/parser.c" },
                branch = "main",
            },
            filetype = "blade",
        }

        vim.filetype.add({
            pattern = {
                [".%.blade%.php"] = "blade",
            }
        })
    end,
}
