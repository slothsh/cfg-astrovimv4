return {
    {
        "AstroNvim/astrocore",
        ---@type AstroCoreOpts
        opts = {
            mappings = {
                i = {
                    ['<A-j>'] = { '<Esc>:move .+1<CR>gi', desc = "Move current line down" },
                    ['<A-k>'] = { '<Esc>:move .-2<CR>gi', desc = "Move current line up" },
                    ['<C-A-j>'] = { '<Esc>:t .+0<CR>gi', desc = "Copy current line down" },
                    ['<C-A-k>'] = { '<Esc>:t .-1<CR>kgi', desc = "Copy current line up" },
                },

                n = {
                    ["<Leader>fR"] = { "<cmd>Telescope lsp_references<cr>", desc = "Find references" },
                    ["<Leader>j]"] = { "<cmd>cnext<cr>", desc = "Jump to next location" },
                    ["<Leader>j["] = { "<cmd>cprev<cr>", desc = "Jump to previous location" },
                    ["<Leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },

                    ["<Leader>bD"] = {
                        function()
                            require("astroui.status").heirline.buffer_picker(function(bufnr)
                                require("astrocore.buffer").close(bufnr)
                            end)
                        end,
                        desc = "Pick to close",
                    },

                    ["<Leader>b"] = { name = "Buffers" },
                    ['<A-j>'] = { ':move .+1<CR>', desc = "Move current line down" },
                    ['<A-k>'] = { ':move .-2<CR>', desc = "Move current line up" },
                    ['<C-A-k>'] = { ':t .-1<CR>', desc = "Copy current line up" },
                    ['<C-A-j>'] = { ':t .+0<CR>', desc = "Copy current line down" },
                    ['<A-l>'] = { 'guee', desc = "Lowercase word right" },
                    ['<A-h>'] = { 'gub', desc = "Lowercase word left" },
                    ['<C-A-l>'] = { 'gUee', desc = "Uppercase word right" },
                    ['<C-A-h>'] = { 'gUb', desc = "Uppercase word left" },
                },

                v = {
                    ['p'] = { '"_dP', desc = "void delete and paste" },
                    ['<A-j>'] = { ":move '>+1<CR>gv", desc = "Move current line down" },
                    ['<A-k>'] = { ":move '<-2<CR>gv", desc = "Move current line up" },
                    ['<C-A-j>'] = { ":t '>+0<CR>gv", desc = "Copy current line down" },
                    ['<C-A-k>'] = { ":t '<-1<CR>gv", desc = "Copy current line up" },
                },
            },
        },
    },
    {
        "AstroNvim/astrolsp",
        ---@type AstroLSPOpts
        opts = {
            mappings = {
                n = {
                    K = {
                        function()
                            vim.lsp.buf.hover()
                        end,
                        desc = "Hover symbol details",
                    },

                    gD = {
                        function()
                            vim.lsp.buf.declaration()
                        end,
                        desc = "Declaration of current symbol",
                        cond = "textDocument/declaration",
                    },
                },
            },
        },
    },
}
