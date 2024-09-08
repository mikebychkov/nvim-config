function Test()
    -- package.loaded.first_steps = nil
    -- require"test.first_steps".todo()
    package.loaded.todolist = nil
    require"test.todolist".todo()
end

vim.api.nvim_create_user_command("Test", Test, {})

-- vim.api.nvim_create_autocmd("CursorHold", { callback = require"test.first_steps".todo })

vim.keymap.set("n", "<leader>T", Test, {})
