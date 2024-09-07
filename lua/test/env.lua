vim.api.nvim_create_user_command("Test", function()
    package.loaded.first_steps = nil
    require"first_steps".todo()
end, {})
