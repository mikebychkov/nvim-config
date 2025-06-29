vim.keymap.set("n", "<leader>b", ":buffers<CR>")
vim.keymap.set("n", "<leader>bn", ":bnext<CR>")
vim.keymap.set("n", "<leader>bb", ":bprev<CR>")

P = function(v)
    print(vim.inspect(v))
    return v
end
