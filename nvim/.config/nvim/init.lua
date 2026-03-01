vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.cursorline = true
vim.opt.winborder = "rounded"
vim.opt.smartindent = true
vim.opt.guicursor = ""
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.wrap = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"

vim.opt.packpath:prepend(vim.fn.stdpath('data') .. '/site')
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
    {src = "https://github.com/nvim-mini/mini.nvim"},
    {src = "https://github.com/nvim-mini/mini.nvim"},
    {src = "https://www.github.com/ibhagwan/fzf-lua"},

    --LSP installs
    {src = "https://github.com/neovim/nvim-lspconfig"},
    {src = "https://github.com/mason-org/mason.nvim"},
    {src = "https://github.com/saghen/blink.cmp"},
    {src = "https://github.com/mrcjkb/rustaceanvim"},

})

require("mini.ai").setup({})
require("mini.comment").setup({})
require("mini.move").setup({})
require("mini.surround").setup({})
require("mini.cursorword").setup({})
require("mini.indentscope").setup({})
require("mini.pairs").setup({})
require("mini.trailspace").setup({})
require("mini.bufremove").setup({})
require("mini.notify").setup({
    lsp_progress = {
        enable = false,
  },
})
require("mini.icons").setup({})
require("mini.snippets").setup({})

require("fzf-lua").setup({})

require("oil").setup({
    keymaps = {
				[".."] = { "actions.parent", mode = "n" },
    }
})

--THEMES!!!!
vim.cmd('colorscheme nordfox')
require("lualine").setup({
		options = {
				theme = 'auto'
		}
})


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


-- ============================================================================
-- LSP, Linting, Formatting & Completion
-- ============================================================================
require("mason").setup({})
local diagnostic_signs = {
	Error = " ",
	Warn = " ",
	Hint = "",
	Info = "",
}

vim.diagnostic.config({
	virtual_text = { prefix = "●", spacing = 4 },
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = diagnostic_signs.Error,
			[vim.diagnostic.severity.WARN] = diagnostic_signs.Warn,
			[vim.diagnostic.severity.INFO] = diagnostic_signs.Info,
			[vim.diagnostic.severity.HINT] = diagnostic_signs.Hint,
		},
	},
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = true,
		header = "",
		prefix = "",
		focusable = false,
		style = "minimal",
	},
})


require("blink.cmp").setup({
    version = "1.*",
    build = "cargo build --release",
	keymap = {
		preset = "none",
		["<C-Space>"] = { "show", "hide" },
		["<C-y>"] = { "accept", "fallback" },
		["<C-j>"] = { "select_next", "fallback" },
		["<C-k>"] = { "select_prev", "fallback" },
		["<Tab>"] = { "snippet_forward", "fallback" },
		["<S-Tab>"] = { "snippet_backward", "fallback" },
	},
	appearance = { nerd_font_variant = "mono" },
	completion = {
        menu = {
            auto_show = false,
            auto_show_delay_ms = 50,
        },
        ghost_text = {enabled = true}
    },
    snippets  = {preset = "mini_snippets"},
	sources = { default = { "lsp", "path", "buffer", "snippets" } },
	fuzzy = {
		implementation = "prefer_rust",
		prebuilt_binaries = { download = true },
	},
})


vim.lsp.config["*"] = {
	capabilities = require("blink.cmp").get_lsp_capabilities(),
}
vim.lsp.config("pyright", {})
vim.lsp.config("bashls", {})
vim.lsp.config("ts_ls", {})
vim.lsp.config("gopls", {})
vim.lsp.config("clangd", {})
vim.lsp.config("clangd", {})
vim.lsp.config('rust_analyzer', {})


vim.lsp.enable({
	"lua_ls",
	"pyright",
	"bashls",
	"ts_ls",
	"gopls",
	"clangd",
    "rust_analyzer",
})

vim.g.rustaceanvim = {
  server = {
    capabilities = require('blink.cmp').get_lsp_capabilities(),
    on_attach = function(client, bufnr)
      -- Optional: add your Rust-specific keymaps here
    end,
  },
}

-- Custom Keybinds
vim.keymap.set('v', '<leader>y', '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>cd", "<Cmd>Oil<CR>")



--	Telescope Keybinds
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })



--	Harpoon Keybinds
require('telescope').load_extension('harpoon')
local harpoon = require("harpoon")
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
