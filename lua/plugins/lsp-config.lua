return {
  {
    "williamboman/mason.nvim",
    --[[
    opts = {
      registries = {
        'github:nvim-java/mason-registry',
        'github:mason-org/mason-registry',
      },
    },
    --]]
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "jdtls" }
      })
    end
  },
  --[[
  {
    'nvim-java/nvim-java',
    config = function()
      require('java').setup()
    end
  },
  --]]
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.jdtls.setup({})

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
      vim.keymap.set('n', 'gc', vim.lsp.buf.incoming_calls, {})
      vim.keymap.set('n', 'go', vim.lsp.buf.outgoing_calls, {})
      vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}
