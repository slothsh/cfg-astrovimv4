-- Globals
local LOREM_IPSUM_WORDS = { 'accumsan', 'accusam', 'ad', 'adipiscing', 'aliquam', 'aliquip', 'aliquyam', 'amet', 'assum', 'at', 'augue', 'autem', 'blandit', 'clita', 'commodo', 'congue', 'consectetuer', 'consequat', 'consetetur', 'cum', 'delenit', 'diam', 'dignissim', 'dolor', 'dolore', 'dolores', 'doming', 'duis', 'duo', 'ea', 'eirmod', 'eleifend', 'elit', 'elitr', 'enim', 'eos', 'erat', 'eros', 'esse', 'est', 'et', 'eu', 'euismod', 'eum', 'ex', 'exerci', 'facer', 'facilisi', 'facilisis', 'feugait', 'feugiat', 'gubergren', 'hendrerit', 'id', 'illum', 'imperdiet', 'in', 'invidunt', 'ipsum', 'iriure', 'iusto', 'justo', 'kasd', 'labore', 'laoreet', 'liber', 'lobortis', 'lorem', 'luptatum', 'magna', 'mazim', 'minim', 'molestie', 'nam', 'nibh', 'nihil', 'nisl', 'no', 'nobis', 'nonummy', 'nonumy', 'nostrud', 'nulla', 'odio', 'option', 'placerat', 'possim', 'praesent', 'qui', 'quis', 'quod', 'rebum', 'sadipscing', 'sanctus', 'sea', 'sed', 'sit', 'soluta', 'stet', 'suscipit', 'takimata', 'tation', 'te', 'tempor', 'tincidunt', 'ullamcorper', 'ut', 'vel', 'velit', 'veniam', 'vero', 'voluptua', 'volutpat', 'vulputate', 'wisi', 'zzril', }

-- Helpers
local function capitalize_string(s)
    return s:sub(1, 1):upper() .. s:sub(2)
end

-- Module
local M = {}

function trim(s)
    return s:match("^%s*(.-)%s*$")
end

function M.copy_current_file_to_clipboard(with_hash)
    local filename = vim.api.nvim_buf_get_name(0)
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))

    if with_hash then
        local git_commit = trim(vim.fn.system([[git rev-parse --short HEAD]]))
        return string.format('%s:%s:%d:%d', git_commit, filename, row, col)
    end

    return string.format('%s:%d:%d', filename, row, col)
end

function M.get_current_color_scheme()
    if vim.g.dark_mode then
        return vim.g.dark_mode_color_scheme
    end
    return vim.g.light_mode_color_scheme
end

function M.toggle_dark_mode()
    vim.g.dark_mode = not vim.g.dark_mode
    if vim.g.dark_mode then
        vim.cmd.colorscheme(vim.g.dark_mode_color_scheme)
    else
        vim.cmd.colorscheme(vim.g.light_mode_color_scheme)
    end
end

function M.set_colorscheme_from_mode(use_dark_mode)
    if use_dark_mode then
        vim.cmd.colorscheme(vim.g.dark_mode_color_scheme)
        vim.g.dark_mode = true
    else
        vim.cmd.colorscheme(vim.g.light_mode_color_scheme)
        vim.g.dark_mode = false
    end
end

function M.lorem_ipsum(word_count)
    local all_words = {}
    local sentence_length = 0

    for n = 1, word_count do
        local word = LOREM_IPSUM_WORDS[math.random(1, #LOREM_IPSUM_WORDS)]
        local capitalize = #all_words == 0 or string.sub(all_words[#all_words], -1) == '.'

        if capitalize then
            word = capitalize_string(word)
        elseif n ~= word_count and sentence_length > 4 and math.random() > 0.5 then
            word = word .. '.'
            sentence_length = 0
        end

        sentence_length = sentence_length + 1
        table.insert(all_words, word)
    end

    return table.concat(all_words, ' ') .. '.'
end

return M
