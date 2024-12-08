return {
    -- "mikebychkov/example-plugin", -- this line for importing from GitHub
    dir = '~/Projects/lua/example-plugin', -- this line for local dir with plugin
    config = function()
        require('example-plugin').setup({
            name = "Mike"
        })
    end
}
