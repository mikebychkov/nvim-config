return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local telescope_builtin = require("telescope.builtin")
			vim.keymap.set("n", "<C-p>", telescope_builtin.find_files, {})
			-- vim.keymap.set("n", "<leader>fg", telescope_builtin.live_grep, {})

			vim.keymap.set("n", "<leader>fg", function()
                local my_curr_word = vim.fn.expand('<cword>')
                telescope_builtin.live_grep({ default_text = my_curr_word })
                -- telescope_builtin.live_grep({ default_text = 'hellomf' })
            end, {})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
