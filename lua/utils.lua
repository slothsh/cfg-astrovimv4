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

return M
