require("nvim-treesitter").setup({
    highlight = { enable = true },
    indent = { enable = true },
})

require("nvim-treesitter").install({
    "c",
    "lua",
    "vim",
    "markdown",
    "rust",
    "cpp",
    "python",
    "go",
    "qmljs",
    "bash",
    "html",
    --        "latex",
    "javascript",
    "json",
    "tsx",
    "typescript",
    "yaml",
})
