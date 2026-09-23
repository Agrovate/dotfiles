vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { src = "https://github.com/ThePrimeagen/harpoon",           version = "harpoon2" },
    { src = "https://github.com/ellisonleao/gruvbox.nvim" },
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/nvim-telescope/telescope.nvim" },
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/EdenEast/nightfox.nvim" },
    { src = "https://github.com/nvim-mini/mini.nvim",            name = "mini.nvim" },
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
    { src = "https://github.com/sheng-tse/jupynvim" },

    --LSP installs
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mrcjkb/rustaceanvim" },
    { src = "https://github.com/stevearc/conform.nvim" },
    { src = "https://github.com/rafamadriz/friendly-snippets" },
})

vim.pack.add({ "https://github.com/saghen/blink.lib", "https://github.com/saghen/blink.cmp" })

vim.cmd("packloadall")
require("options")
require("theme")
require("keybinds")
require("gitsigns").setup({})
require("completions.treesitter")
require("completions.blinkcmp")
require("completions.diagnostics")
require("completions.rustacean")
require("plugins.oil")
require("plugins.mini-mini")
require("plugins.jupy")
require("plugins.conform")
