vim.g.light_mode_color_scheme = 'catppuccin-latte'
vim.g.dark_mode_color_scheme = 'kanagawa-dragon'

local system_mode = string.gsub(vim.fn.system([[defaults read -g AppleInterfaceStyle]]), '\n', '')
if system_mode == 'Dark' then
    vim.g.dark_mode = true
else
    vim.g.dark_mode = false
end

