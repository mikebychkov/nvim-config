return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "jdtls" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
                capabilities = capabilities
            })
			lspconfig.jdtls.setup({
                capabilities = capabilities
            })

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>dd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>ii", vim.lsp.buf.implementation, {})
			vim.keymap.set("n", "<leader>cc", vim.lsp.buf.incoming_calls, {})
			vim.keymap.set("n", "<leader>oo", vim.lsp.buf.outgoing_calls, {})
			-- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>aa", vim.lsp.buf.code_action, {})
		end,
	},
}
