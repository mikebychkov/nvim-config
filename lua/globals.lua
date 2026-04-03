vim.keymap.set("n", "<leader>b", ":buffers<CR>")
vim.keymap.set("n", "<leader>bn", ":bnext<CR>")
vim.keymap.set("n", "<leader>bb", ":bprev<CR>")

P = function(v)
    print(vim.inspect(v))
    return v
end

vim.keymap.set("n", "<leader>fn", function()
  vim.fn.setreg("+", vim.fn.expand("%:t"))
end)

vim.keymap.set("n", "<leader>fp", function()
  vim.fn.setreg("+", vim.fn.expand("%:p"))
end)
