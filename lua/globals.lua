vim.keymap.set("n", "<leader>b", ":buffers<CR>")
vim.keymap.set("n", "<leader>bn", ":bnext<CR>")

P = function(v)
    print(vim.inspect(v))
    return v
end
