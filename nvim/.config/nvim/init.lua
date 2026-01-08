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
		{src = "https://github.com/nvim-treesitter/nvim-treesitter", version = 'master'},
		{src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2"},
		{src = "https://github.com/ellisonleao/gruvbox.nvim"},
		{src = "https://github.com/nvim-lualine/lualine.nvim"},
		{src = "https://github.com/nvim-tree/nvim-web-devicons"},
		{ src = "https://github.com/neovim/nvim-lspconfig" },
		{ src = "https://github.com/mason-org/mason.nvim" },
		{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
		{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
		{ src = "https://github.com/L3MON4D3/LuaSnip" },
		{ src = "https://github.com/rafamadriz/friendly-snippets" },
		{ src = "https://github.com/Saghen/blink.cmp" },
		{ src = "https://github.com/stevearc/dressing.nvim" },
		{src = "https://github.com/nvim-lua/plenary.nvim"},
		{src = "https://github.com/nvim-telescope/telescope.nvim"},
		{src = "https://github.com/stevearc/oil.nvim"},
})
require("oil").setup({
    keymaps = {
				[".."] = { "actions.parent", mode = "n" },
    }
})

--THEMES!!!!
vim.cmd('colorscheme gruvbox')
require("lualine").setup({
		options = {
				theme = 'auto'
		}
})



require('nvim-treesitter.configs').setup({
		ensure_installed = { "c", "lua", "vim", "markdown", "rust" },
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


-- ──────────────── LSP SETTINGS ────────────────

-- Diagnostics UI tweaks
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
})

require("blink.cmp").setup({
  signature = { enabled = true },
  sources = {
    default = { "lsp", "path", "buffer", "snippets" },
  },
})


-- Default capabilities (for blink.cmp)
local capabilities = require("blink.cmp").get_lsp_capabilities()

-- local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Global on_attach for keymaps
local on_attach = function(_, bufnr)
  local map = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
  end

  map("n", "gd", vim.lsp.buf.definition, "Go to definition")
  map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
  map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
  map("n", "go", vim.lsp.buf.type_definition, "Go to type")
  map("n", "gr", vim.lsp.buf.references, "Find references")
  map("n", "K", vim.lsp.buf.hover, "Hover")
  map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
  map("n", "<leader>ca", vim.lsp.buf.code_action, "Code actions")
  map("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, "Format file")
end

-- Mason
require("mason").setup()

-- Make sure mason registry is loaded BEFORE installer
pcall(function()
  require("mason-registry").refresh()
end)

require("mason-lspconfig").setup()

-- Mason ensures servers are installed
require("mason-tool-installer").setup({
  ensure_installed = {
    "lua-language-server",
    "rust-analyzer",
    "pyright",
    "bash-language-server",
    "html-lsp",
    "css-lsp",
    "json-lsp",
    "typescript-language-server",
  }
})


-- Enable LSPs with defaults
vim.lsp.enable("lua_ls", {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      workspace = { checkThirdParty = false },
    },
  },
})

vim.lsp.enable("rust_analyzer", {
  on_attach = on_attach,
  capabilities = capabilities,
})

vim.lsp.enable("pyright", {
  on_attach = on_attach,
  capabilities = capabilities,
})

vim.lsp.enable("ts_ls", { on_attach = on_attach, capabilities = capabilities })
vim.lsp.enable("bashls", { on_attach = on_attach, capabilities = capabilities })
vim.lsp.enable("html", { on_attach = on_attach, capabilities = capabilities })
vim.lsp.enable("cssls", { on_attach = on_attach, capabilities = capabilities })
vim.lsp.enable("jsonls", { on_attach = on_attach, capabilities = capabilities })



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
