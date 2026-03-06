vim.pack.add({
    {
        src = "https://github.com/nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate"
    },
    {src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2"},
    {src = "https://github.com/ellisonleao/gruvbox.nvim"},
    {src = "https://github.com/nvim-lualine/lualine.nvim"},
    {src = "https://github.com/stevearc/dressing.nvim" },
    {src = "https://github.com/nvim-lua/plenary.nvim"},
    {src = "https://github.com/nvim-telescope/telescope.nvim"},
    {src = "https://github.com/stevearc/oil.nvim"},
    {src = "https://github.com/EdenEast/nightfox.nvim"},
    {src = "https://github.com/nvim-mini/mini.nvim", name="mini.nvim"},
    {src = "https://github.com/lewis6991/gitsigns.nvim"},

    --LSP installs
    {src = "https://github.com/neovim/nvim-lspconfig"},
    {src = "https://github.com/mason-org/mason.nvim"},
    {src = "https://github.com/saghen/blink.cmp"},
    {src = "https://github.com/mrcjkb/rustaceanvim"},

})

vim.cmd("packloadall")

require("options")
require("theme")
require("plugins.oil")
require("plugins.mini-mini")
require("plugins.treesitter")
require("lsp.blink")
require("lsp.rustacean")
require("keybinds")
require("gitsigns").setup({})
