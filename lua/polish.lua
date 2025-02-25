-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Disable copilot by default
vim.g.copilot_enabled = false
vim.cmd([[TransparentDisable]])

-- Add custom commands
vim.api.nvim_create_user_command('CopyFileName', function()
    local filename = require('utils').copy_current_file_to_clipboard(false)
    vim.fn.setreg("+", filename)
end, {})

vim.api.nvim_create_user_command('CopyFileNameHash', function()
    local filename = require('utils').copy_current_file_to_clipboard(true)
    vim.fn.setreg("+", filename)
end, {})
