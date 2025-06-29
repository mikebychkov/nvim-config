return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local treesitter_config = require("nvim-treesitter.configs")
		treesitter_config.setup({
			ensure_installed = {
                "c",
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
                "query",
                "markdown",
                "markdown_inline",
                "go",
                "python"
			},
			highlight = { enable = true },
			indent = { enable = true },
            query_linter = {
                enable = true,
                use_virtual_text = true,
                lint_events = {"BufWrite", "CursorHold"},
            },
		})
	end,
}
