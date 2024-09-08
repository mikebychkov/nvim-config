function Test()
    -- package.loaded.first_steps = nil
    -- require"test.first_steps".todo()
    package.loaded["test.todolist"] = nil
    require"test.todolist".todo()
end

function PrintLoaded()
    vim.print(package.loaded)
end

function CleanLoaded()
    package.loaded["test.todolist"] = nil
end

vim.api.nvim_create_user_command("Test", Test, {})

-- vim.api.nvim_create_autocmd("CursorHold", { callback = require"test.first_steps".todo })

vim.keymap.set("n", "<leader>T", Test, {})
vim.keymap.set("n", "<leader>P", PrintLoaded, {})
vim.keymap.set("n", "<leader>C", CleanLoaded, {})
