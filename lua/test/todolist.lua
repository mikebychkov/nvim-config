local M = {}

-- TODO: do something
-- another comment
-- TODO: another thing to do

M.todo = function()

    local query_str = '((comment) @comment (#match? @comment "TODO"))'

    -- :h nvim-treesitter

    local parser = require"nvim-treesitter.parsers".get_parser()
    local query = vim.treesitter.query.parse(parser:lang(), query_str)

    -- lua print(vim.inspect(require'vim.treesitter.query')) -- no parse_query

    vim.print(query)

    -- video time: 11:13

end

return M


-- OPEN MANUALY:
-- :vimgrep TODO %
-- :copen
