return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local treesitter_config = require("nvim-treesitter.configs")
		treesitter_config.setup({
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"luadoc",
				"markdown",
				"java",
				"groovy",
				"json",
				"javascript",
				"typescript",
				"clojure",
			},
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
