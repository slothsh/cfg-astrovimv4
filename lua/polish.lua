-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Disable copilot by default
vim.g.copilot_enabled = false
vim.cmd([[TransparentDisable]])

require('utils').set_colorscheme_from_mode(vim.g.dark_mode)

-- Add custom commands
vim.api.nvim_create_user_command('CopyFileName', function()
    local filename = require('utils').copy_current_file_to_clipboard(false)
    vim.fn.setreg("+", filename)
end, {})

vim.api.nvim_create_user_command('CopyFileNameHash', function()
    local filename = require('utils').copy_current_file_to_clipboard(true)
    vim.fn.setreg("+", filename)
end, {})

vim.api.nvim_create_user_command('ToggleLightDarkMode', function()
    local filename = require('utils').toggle_dark_mode(false)
    vim.fn.setreg("+", filename)
end, {})

vim.api.nvim_create_user_command('LoremIpsum', function(opts)
    local word_count = 20
    local arg_count = tonumber(opts.args)
    if arg_count then
        word_count = arg_count
    end
    vim.api.nvim_put({ require('utils').lorem_ipsum(word_count) }, 'c', true, true)
end, { nargs = '?' })

vim.api.nvim_create_user_command('FindWordsFilteredFiles', function()
    require('utils').dual_grep()
end, {})
