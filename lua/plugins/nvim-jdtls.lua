return {
	"mfussenegger/nvim-jdtls",

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

    -- NEED TO ADD FOLLOWING TO jdtls.py SOMEWHERE NEAR ROW 100 IN exec_args (main - func)
    -- :lua print(vim.fn.stdpath('data'))
    -- /mason/packages/jdtls/bin/jdtls.py
    -- 
    -- "-javaagent:" + str(jdtls_base_path) + "/lombok.jar",
}
