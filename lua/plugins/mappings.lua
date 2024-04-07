return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        i = {

          -- move.nvim
          ['<A-j>'] = { '<Esc>:move .+1<CR>gi', desc = "Move current line down" },
          ['<A-k>'] = { '<Esc>:move .-2<CR>gi', desc = "Move current line up" },
          ['<C-A-j>'] = { '<Esc>:t .+0<CR>gi', desc = "Copy current line down" },
          ['<C-A-k>'] = { '<Esc>:t .-1<CR>kgi', desc = "Copy current line up" },
        },
        -- first key is the mode
        n = {
          -- second key is the lefthand side of the map
          -- mappings seen under group name "Buffer"
          ["<Leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
          ["<Leader>bD"] = {
            function()
              require("astroui.status").heirline.buffer_picker(function(bufnr)
                require("astrocore.buffer").close(bufnr)
              end)
            end,
            desc = "Pick to close",
          },
          -- tables with the `name` key will be registered with which-key if it's installed
          -- this is useful for naming menus
          ["<Leader>b"] = { name = "Buffers" },
          -- quick save
          -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

          -- move.nvim
          ['<A-j>'] = { ':move .+1<CR>', desc = "Move current line down" },
          ['<A-k>'] = { ':move .-2<CR>', desc = "Move current line up" },
          ['<C-A-k>'] = { ':t .-1<CR>', desc = "Copy current line up" },
          ['<C-A-j>'] = { ':t .+0<CR>', desc = "Copy current line down" },

          ['<A-l>'] = { 'guee', desc = "Lowercase word right" },
          ['<A-h>'] = { 'gub', desc = "Lowercase word left" },
          ['<C-A-l>'] = { 'gUee', desc = "Uppercase word right" },
          ['<C-A-h>'] = { 'gUb', desc = "Uppercase word left" },
        },
        t = {
          -- setting a mapping to false will disable it
          -- ["<esc>"] = false,
        },

        v = {
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
          -- this mapping will only be set in buffers with an LSP attached
          K = {
            function()
              vim.lsp.buf.hover()
            end,
            desc = "Hover symbol details",
          },
          -- condition for only server with declaration capabilities
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
