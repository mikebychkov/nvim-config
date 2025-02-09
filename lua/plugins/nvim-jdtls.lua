return {
	"mfussenegger/nvim-jdtls",
	-- config = function()
	--        local data_dir = vim.fn.stdpath('data')
	--        local jdtls_path = data_dir .. '/mason/packages/jdtls'
	--        local lombok_path = data_dir .. '/mason/packages/jdtls/lombok.jar' -- Adjust path to Lombok jar
	-- 	local config1 = {
	-- 		-- cmd = { data_dir .. "/mason/packages/jdtls/bin/jdtls" },
	--            cmd = {
	--                'java',
	--                '-Declipse.application=org.eclipse.jdt.ls.core.id1',
	--                '-Dosgi.bundles.defaultStartLevel=4',
	--                '-Declipse.product=org.eclipse.jdt.ls.core.product',
	--                '-Dlog.protocol=true',
	--                '-Dlog.level=ALL',
	--                '-javaagent:' .. lombok_path, -- <---- This is the important part to enable Lombok
	--                '-Xmx1G',
	--                '--add-modules=ALL-SYSTEM',
	--                '--add-opens', 'java.base/java.util=ALL-UNNAMED',
	--                '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
	--                '-jar', jdtls_path .. '/plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar',
	--                '-configuration', jdtls_path .. '/config_linux', -- Or config_win, config_mac based on your OS
	--                -- '-data', workspace_dir
	--                '-data', './'
	--            },
	-- 		root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", "mvnw", "pom.xml", "build.gradle" }, { upward = true })[1]),
	--            settings = {
	--                java = {
	--                    jdt = {
	--                        ls = {
	--                            lombokSupport = {
	--                                enabled = true
	--                            }
	--                        }
	--                    }
	--                }
	--            },
	--            init_options = {
	--                settings = {
	--                    java = {
	--                        jdt = {
	--                            ls = {
	--                                lombokSupport = {
	--                                    enabled = true
	--                                }
	--                            }
	--                        }
	--                    }
	--                },
	--            },
	-- 	}
	-- 	require("jdtls").start_or_attach(config1)
	-- end,




    config = function()
        local data_dir = vim.fn.stdpath('data')
        root_dir1 = vim.fs.dirname(vim.fs.find({ "gradlew", "mvnw", "pom.xml", "build.gradle" }, { upward = true })[1])
        -- root_dir2 = vim.fs.root(0, { "mvnw", "gradlew", "pom.xml", "build.gradle"})
        -- root_dir3 = vim.fs.find({ "gradlew", "mvnw", "pom.xml", "build.gradle" }, { upward = true })

        -- vim.print(root_dir1)
        -- vim.print(root_dir2)
        -- vim.print(root_dir3)

        if not root_dir1 then
            return
        end

        local config1 = {
            cmd = { data_dir .. "/mason/packages/jdtls/bin/jdtls" },
            -- root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", "mvnw", "pom.xml", "build.gradle" }, { upward = true })[1]),
            -- root_dir = vim.fs.root(0, { "mvnw", "gradlew", "pom.xml", "build.gradle" }),
            root_dir = root_dir1
        }
        require("jdtls").start_or_attach(config1)
    end,

    -- NEED TO ADD FOLLOWING TO jdtls.py SOMEWHERE NEAR ROW 100 IN exec_args
    -- 
    -- "-javaagent:" + str(jdtls_base_path) + "/lombok.jar",



	-- config = function()
	--        root_dir1 = vim.fs.dirname(vim.fs.find({ "gradlew", "mvnw", "pom.xml", "build.gradle" }, { upward = true })[1])
	--        if not root_dir1 then
	--            return
	--        end
	--
	--        local data_dir = vim.fn.stdpath('data')
	--        local jdtls_path = data_dir .. '/mason/packages/jdtls'
	--        local lombok_path = data_dir .. '/mason/packages/jdtls/lombok.jar' -- Adjust path to Lombok jar
	-- 	local config1 = {
	--            cmd = {
	--                'java',
	--                '-Declipse.application=org.eclipse.jdt.ls.core.id1',
	--                '-Dosgi.bundles.defaultStartLevel=4',
	--                '-Declipse.product=org.eclipse.jdt.ls.core.product',
	--                '-Dlog.protocol=true',
	--                '-Dlog.level=ALL',
	--                '-javaagent:' .. lombok_path, -- <---- This is the important part to enable Lombok
	--                '-Xmx1G',
	--                '--add-modules=ALL-SYSTEM',
	--                '--add-opens', 'java.base/java.util=ALL-UNNAMED',
	--                '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
	--                '-jar', jdtls_path .. '/plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar',
	--                '-configuration', jdtls_path .. '/config_linux', -- Or config_win, config_mac based on your OS
	--                '-data', './'
	--            },
	--            root_dir = root_dir1,
	--            settings = {
	--                java = {
	--                    jdt = {
	--                        ls = {
	--                            lombokSupport = {
	--                                enabled = true
	--                            }
	--                        }
	--                    }
	--                }
	--            },
	--            init_options = {
	--                settings = {
	--                    java = {
	--                        jdt = {
	--                            ls = {
	--                                lombokSupport = {
	--                                    enabled = true
	--                                }
	--                            }
	--                        }
	--                    }
	--                },
	--            },
	-- 	}
	-- 	require("jdtls").start_or_attach(config1)
	-- end,

}
