return {
    settings = {
        Lua = {
            completion = {
                callSnippet = "Replace",
            },
            diagnostics = {
                globals = { 'vim' },
            },
        },
        runtime = {
            version = "LuaJIT",
        },
    },
}
