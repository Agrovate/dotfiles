require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettier" },
		typescriptreact = { "prettier" },
		typescript = { "prettier" },
		markdown = { "prettier" },
		html = { "prettier" },
		svelte = { "prettier" },
		python = { "black" },
		nix = { "alejandra" },
		css = { "prettier" },
		rust = { "rustfmt" },
	},
	format_on_save = true,
	undojoin = true,
})

