return {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_dir = vim.fs.root(0, { '.luarc.json', '.luarc.jsonc', '.git' }),
    settings = {
      Lua = {
        runtime = { version = 'LuaJIT' },
        diagnostics = { globals = {'vim'} },
        workspace = { library = vim.api.nvim_get_runtime_file("", true) },
      },
			diagnostics = {
				globals = {
					"vim",
					"require",
				},
			},
   },
}
