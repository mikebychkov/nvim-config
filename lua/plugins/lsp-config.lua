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
            -- https://spring.io/tools
            -- https://neovim.io/doc/user/lsp.html#lsp-quickstart
            -- https://www.youtube.com/watch?v=YsdlcQoHqPY&list=PLouzx2g3Ge11yVwykGn-rXlBvy06OPR1N&index=11

			local jar_path = vim.fn.stdpath("data") .. "/spring-boot-language-server/spring-boot-language-server.jar"
			local lib_path = vim.fn.stdpath("data") .. "/spring-boot-language-server/lib/*"

            print(jar_path)

			local sbls_config = {
				name = "spring_boot_ls",
				cmd = {
                    "java",
                    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
                    "-Dosgi.bundles.defaultStartLevel=4",
                    "-Declipse.product=org.eclipse.jdt.ls.core.product",
                    "-Dlog.level=ALL",  -- Enable detailed logs
                    "-cp", lib_path,
                    "-jar", jar_path
                }, -- Command to start the language server
				filetypes = { "java", }, -- File types supported
				root_dir = function(fname)
					-- return lspconfig.util.root_pattern("pom.xml", "build.gradle", "pom.xml", "build.gradle")(fname) or vim.loop.cwd()
					return vim.fs.dirname(vim.fs.find({ "gradlew", "mvnw", "pom.xml", "build.gradle" }, { upward = true })[1])
				end,
				-- capabilities = vim.lsp.protocol.make_client_capabilities(),
                capabilities = capabilities,
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

            -- lspconfig.spring_boot_ls = {
            --     default_config = {
            --         cmd = {
            --             "java",
            --             "-Declipse.application=org.eclipse.jdt.ls.core.id1",
            --             "-Dosgi.bundles.defaultStartLevel=4",
            --             "-Declipse.product=org.eclipse.jdt.ls.core.product",
            --             "-Dlog.level=ALL",  -- Enable detailed logs
            --             "-jar", jar_path
            --         },
            --         filetypes = { "java" },
            --         root_dir = lspconfig.util.root_pattern("mvnw", "gradlew", "pom.xml", "build.gradle"),
					-- root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", "mvnw", "pom.xml", "build.gradle" }, { upward = true })[1])
            --         capabilities = capabilities,
            --     }
            -- }
            --
            -- vim.api.nvim_create_autocmd("FileType", {
            --   pattern = "java",
            --   callback = function()
            --     vim.cmd("LspStart spring_boot_ls")
            --   end,
            -- })


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
