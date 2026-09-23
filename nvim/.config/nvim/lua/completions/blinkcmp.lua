-- refuses to work on another machine idk why so build from source
-- require('blink.cmp').build():pwait()

local mini_snippets = require("mini.snippets")
mini_snippets.setup({
    snippets = {
        mini_snippets.gen_loader.from_lang(),
    },
    mappings = {
        expand = "",
    },
})

require("blink.cmp").setup({

    keymap = BlinkKeymap,
    fuzzy = {
        implementation = "prefer_rust",
    },

    appearance = { nerd_font_variant = "mono" },

    completion = {
        menu = {
            auto_show = false,
            border = "rounded",
            min_width = 40,
            auto_show_delay_ms = 50,
        },

        list = {
            selection = {
                preselect = true,
                auto_insert = true,
            },
        },
    },

    snippets = { preset = "mini_snippets" },
    sources = { default = { "lsp", "snippets", "buffer", "path" } },
})

vim.lsp.config["*"] = {
    capabilities = require("blink.cmp").get_lsp_capabilities(),
}

vim.lsp.enable({
    "lua_ls",
    "basedpyright",
    "bashls",
    "ts_ls",
    "gopls",
    "clangd",
    "rust_analyzer",
    "nixd",
    "nil",
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "lua",
    callback = function()
        vim.pack.add({
            { src = "https://github.com/folke/lazydev.nvim", name = "lazydev" },
        })
        require("lazydev").setup()
        require("blink.cmp").setup({
            sources = {
                default = { "lazydev", "lsp", "path", "snippets", "buffer" },
                providers = {
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        score_offset = 100,
                    },
                },
            },
        })
    end,
})
