return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				-- null_ls.builtins.formatting.google_java_format,
				-- null_ls.builtins.formatting.clang_format,
				-- null_ls.builtins.formatting.ast_grep,
				-- null_ls.builtins.diagnostics.eslint,
				-- null_ls.builtins.diagnostics.ast_grep,
				-- null_ls.builtins.diagnostics.checkstyle,
				-- null_ls.builtins.completion.spell,
				-- require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
			},
		})
		vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, {})
	end,
}
