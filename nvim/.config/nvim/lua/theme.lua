require('nightfox').setup({
    options = {
        transparent = true,
        styles = {
            floats = "transparent",
        }
    }
})

require("gruvbox").setup({
    transparent_mode = true,
})

vim.cmd("colorscheme nordfox")

require("lualine").setup({
    options = {
        theme = 'auto'
    }
})
