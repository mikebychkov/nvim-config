vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

require("config.lazy")

local telescope_builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', telescope_builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope_builtin.live_grep, {})

local treesitter_config = require("nvim-treesitter.configs")
treesitter_config.setup({
  ensure_installed = {"lua", "vim", "java", "javascript", "typescript", "clojure"},
  highlight = { enable = true },
  indent = { enable = true },
})

require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"

