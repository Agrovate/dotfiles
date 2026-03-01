vim.g.rustaceanvim = {
  server = {
    capabilities = require('blink.cmp').get_lsp_capabilities(),
    on_attach = function(client, bufnr)
      -- Optional: add your Rust-specific keymaps here
    end,
  },
}
