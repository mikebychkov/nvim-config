return {
	"mfussenegger/nvim-jdtls",
	config = function()
        local data_dir = vim.fn.stdpath('data')
        local jdtls_path = data_dir .. '/mason/packages/jdtls'
        local lombok_path = data_dir .. '/mason/packages/jdtls/lombok.jar' -- Adjust path to Lombok jar
		local config = {
			-- cmd = { data_dir .. "/mason/packages/jdtls/bin/jdtls" },
            cmd = {
                'java',
                '-Declipse.application=org.eclipse.jdt.ls.core.id1',
                '-Dosgi.bundles.defaultStartLevel=4',
                '-Declipse.product=org.eclipse.jdt.ls.core.product',
                '-Dlog.protocol=true',
                '-Dlog.level=ALL',
                '-javaagent:' .. lombok_path, -- <---- This is the important part to enable Lombok
                '-Xmx1G',
                '--add-modules=ALL-SYSTEM',
                '--add-opens', 'java.base/java.util=ALL-UNNAMED',
                '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
                '-jar', jdtls_path .. '/plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar',
                '-configuration', jdtls_path .. '/config_linux', -- Or config_win, config_mac based on your OS
                -- '-data', workspace_dir
                '-data', './'
            },
			root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
            settings = {
                java = {
                    jdt = {
                        ls = {
                            lombokSupport = {
                                enabled = true
                            }
                        }
                    }
                }
            },
            init_options = {
                settings = {
                    java = {
                        jdt = {
                            ls = {
                                lombokSupport = {
                                    enabled = true
                                }
                            }
                        }
                    }
                },
            },
		}
		require("jdtls").start_or_attach(config)
	end,
}
