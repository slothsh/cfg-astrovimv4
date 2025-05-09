local pickers = require 'telescope.pickers'
local previewers = require 'telescope.previewers'
local finders = require 'telescope.finders'
local make_entry = require 'telescope.make_entry'

local M = {}

local multigrep_glob = function(opts)
    opts = opts or {}
    opts.cwd = opts.cwd or vim.uv.cwd()

    local finder = finders.new_async_job {
        command_generator = function(prompt)
            if not prompt or prompt == '' then
                return nil
            end

            local pieces = vim.split(prompt, '  ')
            local args = { 'rg' }
            if pieces[1] then
                table.insert(args, '-e')
                table.insert(args, pieces[1])
            end

            if pieces[2] then
                table.insert(args, '-g')
                table.insert(args, pieces[2])
            end

            ---@diagnostic disable-next-line: deprecated
            return vim.tbl_flatten {
                args,
                { '--color=never', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case' },
            }
        end,
        entry_maker = make_entry.gen_from_vimgrep(opts),
        cwd = opts.cwd,
    }

    -- Create a new picker
    pickers.new(opts, {
        debounce = 100,
        prompt_title = 'Live Grep',
        previewer = previewers.vim_buffer_vimgrep.new({}),
        finder = finder,
    }):find()
end

M.multigrep_glob = function()
    multigrep_glob()
end

return M
