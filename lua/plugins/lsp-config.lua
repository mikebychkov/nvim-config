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
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.jdtls.setup({
				capabilities = capabilities,
			})

			-- SPRING BOOT LS

			local jar_path = vim.fn.stdpath("data") .. "/spring-boot-language-server/spring-boot-language-server.jar"
			local lib_path = vim.fn.stdpath("data") .. "/spring-boot-language-server/lib/*"

			local sbls_config = {
				name = "spring-boot-ls",
				cmd = { "java", "-cp", lib_path, "-jar", jar_path }, -- Command to start the language server
				filetypes = { "java", "properties", "yml", "yaml" }, -- File types supported
				root_dir = function(fname)
					-- return lspconfig.util.root_pattern("pom.xml", "build.gradle", ".git")(fname) or vim.loop.cwd()
					return vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1])
				end,
				capabilities = vim.lsp.protocol.make_client_capabilities(),
				on_attach = function(client, bufnr)
					print("SPRING BOOT LSP attached to buffer " .. bufnr)
				end,
			}

			lspconfig.spring_boot_ls = {
				default_config = sbls_config,
			}

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "java",
				callback = function(args)
					print("HEY I'M CALLBACK FROM YOUR BRAND NEW LSP!!!")
					vim.lsp.start({
						name = sbls_config.name,
						cmd = sbls_config.cmd,
						root_dir = sbls_config.root_dir(),
						capabilities = sbls_config.capabilities,
                        on_attach = sbls_config.on_attach
					})
					-- vim.lsp.start_or_attach(sbls_config)
				end,
			})

			-- vim.lsp.start_or_attach(lspconfig.spring_boot_ls.default_config)

			-- KEYMAPPINGS

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
