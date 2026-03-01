require('nvim-treesitter.configs').setup({
    ensure_installed = { "c", "lua", "vim", "markdown", "rust", "cpp", "python", "go" },
    auto_install = false,
    sync_install = false,
    highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
    },
    indent = {
            enable = true,
    },
    ignore_install = {},
    modules = {},
})
