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
    -- vim.print(query)

    local tree = parser:parse()[1]

    local qf_list = {}

    for _, n in query:iter_captures(tree:root(), 0) do
        local text = vim.treesitter.get_node_text(n, 0)
        -- print(text)
        local lnum, col = n:range()
        table.insert(qf_list, {
            bufnr = vim.api.nvim_get_current_buf(),
            text = text,
            lnum = lnum + 1,
            col = col + 1
        })
    end

    print(vim.inspect(qf_list))

    vim.fn.setqflist(qf_list)
    vim.cmd.copen()

end

return M


-- OPEN MANUALY:
-- :vimgrep TODO %
-- :copen
